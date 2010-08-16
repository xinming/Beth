class CreateUnitConversions < ActiveRecord::Migration
  def self.up
    create_table :unit_conversions do |t|
      t.string :unit1
      t.string :unit2
      t.decimal :ratio
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :unit_conversions
  end
end