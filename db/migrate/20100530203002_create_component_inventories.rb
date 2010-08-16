class CreateComponentInventories < ActiveRecord::Migration
  def self.up
    create_table :component_inventories do |t|
      t.integer :component_id
      t.integer :inventory_item_type_id
      t.decimal :amount
      
    end
  end
  
  def self.down
    drop_table :component_inventories
  end
end