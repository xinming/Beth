class AddContactGroupIdToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :contact_group_id, :integer
  end

  def self.down
    remove_column :contacts, :contact_group_id
  end
end
