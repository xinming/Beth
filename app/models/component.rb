class Component < ActiveRecord::Base
  belongs_to :group, :class_name => 'ComponentGroup', :foreign_key => 'group_id'

  has_many :component_inventories
  has_many :inventory_item_types, :through => :component_inventories

  def to_s
    name
  end
end
