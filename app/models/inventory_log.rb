class InventoryLog < ActiveRecord::Base
  belongs_to :inventory_item_type
  belongs_to :order
  
  after_save :update_inventory_summary
  after_destroy :update_inventory_summary
  
  def is_source_order?
    if self.order_id.nil?
      return false
    else
      return true
    end
  end
  
  def update_inventory_summary
    items = InventoryLog.sum(:amount, :group=>'inventory_item_type_id')
    InventorySummary.destroy_all
#    raise InventorySummary.methods.inspe
    items.each do |item|
      InventorySummary.create('inventory_item_type_id'=>item[0], 'amount'=>item[1])
    end
  end

end
