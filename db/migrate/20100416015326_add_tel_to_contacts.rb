class AddTelToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :tel, :string
  end

  def self.down
    remove_column :contacts, :tel
  end
end
