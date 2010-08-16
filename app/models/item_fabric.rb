class ItemFabric < ActiveRecord::Base
  belongs_to :item
  belongs_to :fabric, :class_name=>'InventoryItemType', :foreign_key=>'fabric_id'
  
  before_save :check_values
  after_save :calculate_order_total
  
  protected
  
  def check_values
    if self.amount.blank?
      self.amount = 1
    end
    if self.unit.blank?
      self.unit = 'meter'
    end
  end
  
  def calculate_order_total
    self.item.order.calculate_total
    self.item.order.save
  end
  
  
end
