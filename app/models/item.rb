class Item < ActiveRecord::Base
 
  belongs_to :item_type
  belongs_to :order, :class_name=>'IncomingOrder', :foreign_key=>'order_id'
  #has_many :fabrics, :through=>:item_fabrics
  #has_many :item_fabrics
  #has_many :fabrics, :class_name=>'InventoryItemType', :conditions=>"fabric='t'", :through=>:item_fabrics
  has_many :costs
  accepts_nested_attributes_for :costs, :allow_destroy => true
  

  #has_many :values, :class_name => 'ItemComponentValue', :dependent => :destroy
  #has_many :item_measurement_infos
#  has_and_belongs_to_many :fabrics
  #accepts_nested_attributes_for :values

 # after_save :add_item_component_inventories
  #after_destroy :update_order_items_cache
  #after_create :add_item_measurement_infos
  after_create :add_required_cost
  
  def price
    price = 0
    self.costs.each do |c|
      price = price + c.amount
    end
    price
  end  
  
  protected
  
  def add_required_cost
    self.item_type.item_type_costs.required.each do |tc|
      Cost.create(:item_id=>self.id, :item_type_cost_id=>tc.id, :amount=>tc.amount)
    end
  end

  #Updates the order items_cache column
  def update_order_items_cache
    unless self.order.nil?
      order = Order.find(self.order)
      order.save
    end
  end
  
  def add_item_component_inventories
    self.values.each do |value|
      inventories = ComponentInventory.find_all_by_component_id(value.value)
      unless inventories.nil?
        inventories.each do |inv|
          foo = ItemComponentInventory.create(:item_component_value=>value, :inventory_item_type_id=>inv.inventory_item_type_id, :amount=>inv.amount)
        end
      end
    end
  end

  def add_item_measurement_infos
    contact_measurement_infos = ContactMeasurementInfo.find(:all, :conditions=>{:contact_id=>self.order.orderer_id, :measurement_info_id=>MeasurementInfo.find_all_by_item_type_id(self.item_type_id)})
#    raise contact_measurement_infos.inspect
    contact_measurement_infos.each do |info|
      ItemMeasurementInfo.create(:item_id=>self.id, :measurement_info_id=>info.measurement_info_id, :value=>info.value)
    end
  end

end
