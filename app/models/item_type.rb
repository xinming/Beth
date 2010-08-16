class ItemType < ActiveRecord::Base
  #has_many :component_groups  
  #has_many :measurement_infos
  has_many :item_type_costs

  def to_s
    self.name
  end
end
