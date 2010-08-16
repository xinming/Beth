class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.belongs_to :order
      t.belongs_to :item_type
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :items
  end
end
