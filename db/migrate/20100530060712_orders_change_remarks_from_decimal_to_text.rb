class OrdersChangeRemarksFromDecimalToText < ActiveRecord::Migration
  def self.up
    change_column :orders, :remarks, :text
  end

  def self.down
    change_column :orders, :remarks, :decimals
  end
end
