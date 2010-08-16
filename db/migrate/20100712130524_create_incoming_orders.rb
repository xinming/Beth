class CreateIncomingOrders < ActiveRecord::Migration
  def self.up
    create_table :incoming_orders do |t|
      t.integer :customer_id
      t.date :date
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :incoming_orders
  end
end