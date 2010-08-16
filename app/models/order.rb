class Order < ActiveRecord::Base
  belongs_to :orderer, :class_name => 'Contact', :foreign_key => 'orderer_id'
  belongs_to :referrer, :class_name => 'Contact', :foreign_key => 'referrer_id'

  before_save :update_cached_columns, :calculate_total
  after_update :add_item_component_inventories

  has_many :items
  accepts_nested_attributes_for :items, :allow_destroy => true

protected

  def update_cached_columns
#    raise self.items.size.inspect
    self.items_cache = self.items.size
  end

  def add_item_component_inventories
    self.items.each do |item|
      item.values.each do |value|
        inventories = ComponentInventory.find_all_by_component_id(value.value)
        unless inventories.nil?
          inventories.each do |inv|
            foo = ItemComponentInventory.create(:item_component_value=>value, :inventory_item_type_id=>inv.inventory_item_type_id, :amount=>inv.amount)
          end
        end
      end
    end
  end
  
  def calculate_total
    total = 0
    self.items.each do |item|
      item_cost = 0
      item.item_fabrics.each do |item_fabric|
        fabric_amount = 0
        fabric_amount = item_fabric.amount * UnitConversion.ratio(item_fabric.unit, item_fabric.fabric.unit)
        item_cost += item_fabric.fabric.price_per_unit * fabric_amount
      end
      total += item_cost
    end
    self.total = total
  end


end
