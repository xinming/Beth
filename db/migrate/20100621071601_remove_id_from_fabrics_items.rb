class RemoveIdFromFabricsItems < ActiveRecord::Migration
  def self.up
    remove_column :fabrics_items, :id
  end

  def self.down
    add_column :fabrics_items, :id, :integer
  end
end
