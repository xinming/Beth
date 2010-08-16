class AddFabricIdToInventoryLogs < ActiveRecord::Migration
  def self.up
    add_column :inventory_logs, :fabric_id, :string
  end

  def self.down
    remove_column :inventory_logs, :fabric_id
  end
end
