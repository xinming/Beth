class CreateInventorySummaries < ActiveRecord::Migration
  def self.up
    create_table :inventory_summaries do |t|
      t.integer :inventory_item_type_id
      t.decimal :amount
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :inventory_summaries
  end
end