class ComponentInventory < ActiveRecord::Base
  belongs_to :inventory_item_type
  belongs_to :component
end
