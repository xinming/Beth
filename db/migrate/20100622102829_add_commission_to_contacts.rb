class AddCommissionToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :commission, :decimal
  end

  def self.down
    remove_column :contacts, :commission
  end
end
