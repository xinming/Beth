class CreateItemFabrics < ActiveRecord::Migration
  def self.up
    create_table :item_fabrics do |t|
      t.integer :item_id
      t.integer :fabric_id
      t.decimal :amount
      t.string :unit
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :item_fabrics
  end
end