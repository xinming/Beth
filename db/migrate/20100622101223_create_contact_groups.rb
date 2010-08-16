class CreateContactGroups < ActiveRecord::Migration
  def self.up
    create_table :contact_groups do |t|
      t.string :name
      t.decimal :commission
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :contact_groups
  end
end