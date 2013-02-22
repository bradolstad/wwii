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

ActiveRecord::Schema.define(:version => 20130222025813) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.integer  "unit_type_id"
    t.string   "size"
    t.integer  "icon_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "companies", ["icon_id"], :name => "index_companies_on_icon_id"
  add_index "companies", ["unit_type_id"], :name => "index_companies_on_unit_type_id"

  create_table "company_events", :force => true do |t|
    t.integer  "company_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "company_events", ["company_id"], :name => "index_company_events_on_company_id"
  add_index "company_events", ["event_id"], :name => "index_company_events_on_event_id"

  create_table "event_types", :force => true do |t|
    t.string   "name"
    t.integer  "icon_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "event_types", ["icon_id"], :name => "index_event_types_on_icon_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "location_id"
    t.datetime "date"
    t.integer  "campaign_id"
    t.integer  "zoom_level"
    t.integer  "event_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "events", ["campaign_id"], :name => "index_events_on_campaign_id"
  add_index "events", ["event_type_id"], :name => "index_events_on_event_type_id"
  add_index "events", ["location_id"], :name => "index_events_on_location_id"

  create_table "icons", :force => true do |t|
    t.string   "path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations", :force => true do |t|
    t.float    "lattitude"
    t.float    "longitude"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "operations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "unit_types", :force => true do |t|
    t.string   "name"
    t.integer  "icon_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "unit_types", ["icon_id"], :name => "index_unit_types_on_icon_id"

end
