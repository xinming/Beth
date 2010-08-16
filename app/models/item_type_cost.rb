class ItemTypeCost < ActiveRecord::Base
  belongs_to :item_type
  named_scope :required, :conditions => {:is_required => 't'}
  named_scope :optional, :conditions => {:is_required => 'f'}
  
  def to_s
    self.name
  end
  
end
