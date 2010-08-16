class InventoryItemType < ActiveRecord::Base
  has_many :component_inventories
  has_many :components, :through => :component_inventories

  #Paperclip
  has_attached_file :photo, :styles=>{:thumb=>"100x100#", :medium=>"500x500>"}

  def to_s
    self.name
  end
end
