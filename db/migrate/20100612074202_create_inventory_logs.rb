class CreateInventoryLogs < ActiveRecord::Migration
  def self.up
    create_table :inventory_logs do |t|
      t.integer :inventory_item_type_id
      t.decimal :amount
      t.integer :order_id
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :inventory_logs
  end
end