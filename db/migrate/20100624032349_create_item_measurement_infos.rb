class CreateItemMeasurementInfos < ActiveRecord::Migration
  def self.up
    create_table :item_measurement_infos do |t|
      t.integer :item_id
      t.integer :measurement_info_id
      t.decimal :value
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :item_measurement_infos
  end
end