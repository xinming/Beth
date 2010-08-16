class CreateFabrics < ActiveRecord::Migration
  def self.up
    create_table :fabrics do |t|
      t.string :code
      t.string :name
      t.text :description
      t.decimal :price_per_unit
      t.string :unit
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :fabrics
  end
end