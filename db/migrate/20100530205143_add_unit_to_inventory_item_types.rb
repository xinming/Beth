class AddUnitToInventoryItemTypes < ActiveRecord::Migration
  def self.up
    add_column :inventory_item_types, :unit, :string
  end

  def self.down
    remove_column :inventory_item_types, :unit
  end
end
