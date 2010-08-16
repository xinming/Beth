class CreateItemTypeCosts < ActiveRecord::Migration
  def self.up
    create_table :item_type_costs do |t|
      t.integer :item_type_id
      t.string :name
      t.decimal :amount
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :item_type_costs
  end
end