class AddIsRequiredToItemTypeCosts < ActiveRecord::Migration
  def self.up
    add_column :item_type_costs, :is_required, :boolean
  end

  def self.down
    remove_column :item_type_costs, :is_required
  end
end
