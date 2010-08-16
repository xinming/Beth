class CreateCosts < ActiveRecord::Migration
  def self.up
    create_table :costs do |t|
      t.integer :item_id
      t.integer :item_type_cost_id
      t.decimal :amount
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :costs
  end
end