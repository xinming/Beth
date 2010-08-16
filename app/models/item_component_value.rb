class ItemComponentValue < ActiveRecord::Base
  belongs_to :item
  belongs_to :component_group
  belongs_to :component, :foreign_key => 'value'
  has_many :item_component_inventories
  
#  after_update :add_item_component_inventories
  
  def component_name
    component = Component.find(self.value)
    component.name
  end
  
  def add_item_component_inventories
    inventories = ComponentInventory.find_all_by_component_id(self.value)
    unless inventories.nil?
      inventories.each do |inv|
        foo = ItemComponentInventory.create(:item_component_value=>self, :inventory_item_type_id=>inv.inventory_item_type_id, :amount=>inv.amount)
      end
    end
  end
  
end


