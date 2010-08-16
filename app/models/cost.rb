class Cost < ActiveRecord::Base
  belongs_to :item_type_cost
  belongs_to :item
  belongs_to :incoming_order

end
