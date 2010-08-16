class AddFabricsToInventoryItemTypes < ActiveRecord::Migration
  def self.up
    add_column :inventory_item_types, :code, :string
    add_column :inventory_item_types, :description, :text
    add_column :inventory_item_types, :price_per_unit, :decimal
    add_column :inventory_item_types, :photo_file_name, :string
    add_column :inventory_item_types, :photo_content_type, :string
    add_column :inventory_item_types, :photo_file_size, :integer
  end

  def self.down
    remove_column :inventory_item_types, :code
    remove_column :inventory_item_types, :description
    remove_column :inventory_item_types, :price_per_unit
    remove_column :inventory_item_types, :photo_file_name
    remove_column :inventory_item_types, :photo_content_type
    remove_column :inventory_item_types, :photo_file_size
  end
end
