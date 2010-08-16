class InventorySummary < ActiveRecord::Base
  belongs_to :inventory_item_type
  
end
