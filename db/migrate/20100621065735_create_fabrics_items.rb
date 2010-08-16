class CreateFabricsItems < ActiveRecord::Migration
  def self.up
    create_table :fabrics_items do |t|
      t.integer :fabric_id
      t.integer :item_id
    end
  end

  def self.down
    drop_table :fabrics_items
  end
end
