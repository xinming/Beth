class ComponentGroup < ActiveRecord::Base
  belongs_to :item_type
  has_many :components, :foreign_key => 'group_id'

  def to_s
    self.name
  end
end
