class ContactMeasurementInfo < ActiveRecord::Base
  belongs_to :contact
  belongs_to :measurement_info
end
