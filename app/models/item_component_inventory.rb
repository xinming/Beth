class ItemComponentInventory < ActiveRecord::Base
  belongs_to :item_component_value
  belongs_to :inventory_item_type


end
