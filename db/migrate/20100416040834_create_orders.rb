class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :orderer_id
      t.integer :referrer_id

      t.integer :items_cache
      t.decimal :exchange_rate
      t.decimal :tax
      t.decimal :total
      t.decimal :remarks
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :orders
  end
end
