# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130318162335) do

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.integer  "old_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "flag_path"
  end

  add_index "countries", ["old_id"], :name => "index_countries_on_old_id"

  create_table "event_attributes", :force => true do |t|
    t.integer  "event_id"
    t.integer  "unit_id"
    t.integer  "country_id"
    t.integer  "operation_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "event_attributes", ["country_id"], :name => "index_event_attributes_on_country_id"
  add_index "event_attributes", ["event_id"], :name => "index_event_attributes_on_event_id"
  add_index "event_attributes", ["operation_id"], :name => "index_event_attributes_on_operation_id"
  add_index "event_attributes", ["unit_id"], :name => "index_event_attributes_on_unit_id"

  create_table "event_dates", :force => true do |t|
    t.string   "name"
    t.integer  "old_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "lat"
    t.float    "lng"
    t.integer  "unique_id"
    t.boolean  "gmaps"
    t.datetime "event_date"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "old_id"
    t.string   "address"
    t.integer  "unit_id"
    t.integer  "country_id"
    t.integer  "operation_id"
    t.integer  "event_type_id", :default => 0
  end

  add_index "events", ["country_id"], :name => "index_events_on_country_id"
  add_index "events", ["operation_id"], :name => "index_events_on_operation_id"
  add_index "events", ["unit_id"], :name => "index_events_on_unit_id"

  create_table "operations", :force => true do |t|
    t.string   "name"
    t.integer  "campaign_id"
    t.integer  "old_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "description"
    t.boolean  "active",      :default => true
  end

  add_index "operations", ["active"], :name => "index_operations_on_active"
  add_index "operations", ["old_id"], :name => "index_operations_on_old_id"

  create_table "unit_classes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "marker_path"
  end

  create_table "unit_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.integer  "unit_type_id"
    t.integer  "old_id"
    t.integer  "country_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "unit_class_id"
  end

  add_index "units", ["country_id"], :name => "index_units_on_country_id"
  add_index "units", ["old_id"], :name => "index_units_on_old_id"
  add_index "units", ["unit_type_id"], :name => "index_units_on_unit_type_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
