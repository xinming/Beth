class CreateItemComponentInventories < ActiveRecord::Migration
  def self.up
    create_table :item_component_inventories do |t|
      t.integer :item_component_value_id
      t.integer :inventory_item_type_id
      t.decimal :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :item_component_inventories
  end
end
