class AddFabricToInventoryItemTypes < ActiveRecord::Migration
  def self.up
    add_column :inventory_item_types, :fabric, :boolean
  end

  def self.down
    remove_column :inventory_item_types, :fabric
  end
end
