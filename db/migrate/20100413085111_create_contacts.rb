class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.text :address
      t.string :country
      t.string :email
      t.boolean :is_supplier
      t.boolean :is_client
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :contacts
  end
end