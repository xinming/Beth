class MeasurementInfo < ActiveRecord::Base
  belongs_to :item_type

  def to_s
    self.name
  end
end
