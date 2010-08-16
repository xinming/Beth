class RemoveForFromComponents < ActiveRecord::Migration
  def self.up
    remove_column :components, :for
  end

  def self.down
    add_column :components, :for, :string
  end
end
