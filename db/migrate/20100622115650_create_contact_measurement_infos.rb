class CreateContactMeasurementInfos < ActiveRecord::Migration
  def self.up
    create_table :contact_measurement_infos do |t|
      t.integer :contact_id
      t.integer :measurement_info_id
      t.decimal :value
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :contact_measurement_infos
  end
end