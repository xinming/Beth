class ItemMeasurementInfo < ActiveRecord::Base
  belongs_to :item
  belongs_to :measurement_info
  has_one :contact, :through=>'Item'
  
end
