class CreateItemComponentValues < ActiveRecord::Migration
  def self.up
    create_table :item_component_values do |t|
      t.belongs_to :item
      t.belongs_to :component_group
      t.string :value
    end
  end
  
  def self.down
    drop_table :item_component_values
  end
end
