class AddItemTypeIdToComponentGroups < ActiveRecord::Migration
  def self.up
    add_column :component_groups, :item_type_id, :integer
  end

  def self.down
    remove_column :component_groups, :item_type_id
  end
end
