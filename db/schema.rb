# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 10) do

  create_table "cleaning_events", :force => true do |t|
    t.integer  "user_id",                        :null => false
    t.text     "blog"
    t.integer  "geo_location_id"
    t.integer  "weight",          :default => 0, :null => false
    t.datetime "cleaning_at",                    :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "cleaning_events", ["user_id"], :name => "index_cleaning_events_on_user_id"
  add_index "cleaning_events", ["geo_location_id"], :name => "index_cleaning_events_on_geo_location_id"
  add_index "cleaning_events", ["cleaning_at"], :name => "index_cleaning_events_on_cleaning_at"

  create_table "db_files", :force => true do |t|
    t.binary "data"
  end

  create_table "geo_locations", :force => true do |t|
    t.string   "name",                                        :null => false
    t.text     "description"
    t.decimal  "lat",         :precision => 20, :scale => 15, :null => false
    t.decimal  "lng",         :precision => 20, :scale => 15, :null => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "geo_locations", ["lat"], :name => "index_geo_locations_on_lat"
  add_index "geo_locations", ["lng"], :name => "index_geo_locations_on_lng"

  create_table "pictures", :force => true do |t|
    t.integer "cleaning_event_id"
    t.string  "content_type"
    t.string  "filename"
    t.integer "size"
    t.integer "parent_id"
    t.string  "thumbnail"
    t.integer "width"
    t.integer "height"
    t.integer "db_file_id"
    t.integer "user_id"
  end

  add_index "pictures", ["cleaning_event_id"], :name => "index_pictures_on_cleaning_event_id"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "email",           :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "geo_location_id"
    t.integer  "preallowed_id"
  end

  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["hashed_password"], :name => "index_users_on_hashed_password"
  add_index "users", ["salt"], :name => "index_users_on_salt"
  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["first_name"], :name => "index_users_on_first_name"
  add_index "users", ["last_name"], :name => "index_users_on_last_name"

end
