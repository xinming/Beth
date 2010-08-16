class CreateInventoryItemTypes < ActiveRecord::Migration
  def self.up
    create_table :inventory_item_types do |t|
      t.string :name
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :inventory_item_types
  end
end