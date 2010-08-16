class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.string :name
      t.text :description
      t.string :type

      t.integer :item_id
      t.integer :item_type
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :components
  end
end
