class CreateMeasurementInfos < ActiveRecord::Migration
  def self.up
    create_table :measurement_infos do |t|
      t.string :name
      t.text :description
      t.integer :item_type_id
    end
  end
  
  def self.down
    drop_table :measurement_infos
  end
end
