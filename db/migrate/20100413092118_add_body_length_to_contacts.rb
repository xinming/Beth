class AddBodyLengthToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :body_length, :decimal
  end

  def self.down
    remove_column :contacts, :body_length
  end
end
