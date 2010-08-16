class RenameTypeToForInComponents < ActiveRecord::Migration
  def self.up
    rename_column :components, :type, :for
  end

  def self.down
    rename_column :components, :for, :type
  end
end
