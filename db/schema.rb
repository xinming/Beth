# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100712130524) do

  create_table "component_groups", :force => true do |t|
    t.string  "name"
    t.integer "item_type_id"
  end

  create_table "component_inventories", :force => true do |t|
    t.integer "component_id"
    t.integer "inventory_item_type_id"
    t.decimal "amount"
  end

  create_table "components", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "item_id"
    t.integer  "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "contact_groups", :force => true do |t|
    t.string   "name"
    t.decimal  "commission"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_measurement_infos", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "measurement_info_id"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_measurements", :force => true do |t|
    t.integer  "contact_id"
    t.integer  "measurement_info_id"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "country"
    t.string   "email"
    t.boolean  "is_supplier"
    t.boolean  "is_client"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name"
    t.decimal  "body_length"
    t.string   "tel"
    t.decimal  "body_height"
    t.decimal  "body_weight"
    t.integer  "contact_group_id"
    t.decimal  "commission"
  end

  create_table "costs", :force => true do |t|
    t.integer  "item_id"
    t.integer  "item_type_cost_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fabrics", :id => false, :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.decimal  "price_per_unit"
    t.string   "unit"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "id"
  end

  create_table "fabrics_items", :id => false, :force => true do |t|
    t.integer "fabric_id"
    t.integer "item_id"
  end

  create_table "incoming_orders", :force => true do |t|
    t.integer  "customer_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventory_item_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unit"
    t.string   "code"
    t.text     "description"
    t.decimal  "price_per_unit"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.boolean  "fabric"
  end

  create_table "inventory_logs", :force => true do |t|
    t.integer  "inventory_item_type_id"
    t.decimal  "amount"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fabric_id"
  end

  create_table "inventory_summaries", :force => true do |t|
    t.integer  "inventory_item_type_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_component_inventories", :force => true do |t|
    t.integer  "item_component_value_id"
    t.integer  "inventory_item_type_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_component_values", :force => true do |t|
    t.integer "item_id"
    t.integer "component_group_id"
    t.string  "value"
  end

  create_table "item_fabrics", :force => true do |t|
    t.integer  "item_id"
    t.integer  "fabric_id"
    t.decimal  "amount"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_measurement_infos", :force => true do |t|
    t.integer  "item_id"
    t.integer  "measurement_info_id"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_type_costs", :force => true do |t|
    t.integer  "item_type_id"
    t.string   "name"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_required"
  end

  create_table "item_types", :force => true do |t|
    t.string "name"
  end

  create_table "items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "measurement_infos", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "item_type_id"
  end

  create_table "orders", :force => true do |t|
    t.integer  "orderer_id"
    t.integer  "referrer_id"
    t.integer  "items_cache"
    t.decimal  "exchange_rate"
    t.decimal  "tax"
    t.decimal  "total"
    t.text     "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_conversions", :force => true do |t|
    t.string   "unit1"
    t.string   "unit2"
    t.decimal  "ratio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
