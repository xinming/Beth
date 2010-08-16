class AddBodySizeToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :body_height, :decimal
    add_column :contacts, :body_weight, :decimal
  end

  def self.down
    remove_column :contacts, :body_weight
    remove_column :contacts, :body_height
  end
end
