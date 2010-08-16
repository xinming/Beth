class AddGroupIdToComponents < ActiveRecord::Migration
  def self.up
    add_column :components, :group_id, :integer
  end

  def self.down
    remove_column :components, :group_id
  end
end
