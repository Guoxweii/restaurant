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

ActiveRecord::Schema.define(:version => 20130110141807) do

  create_table "categories", :force => true do |t|
    t.string   "se_name"
    t.string   "en_name"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "row_order"
  end

  create_table "cdrs", :force => true do |t|
    t.string   "ip_address"
    t.string   "local_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "area"
    t.time     "ok_time"
  end

  create_table "checks", :force => true do |t|
    t.integer  "order_id"
    t.integer  "num",        :default => 1
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "code"
  end

  create_table "checks_varieties", :force => true do |t|
    t.integer "check_id"
    t.integer "variety_id"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "items", :force => true do |t|
    t.integer  "category_id"
    t.text     "en_content"
    t.text     "se_content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "orders", :force => true do |t|
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.datetime "ok_time"
    t.string   "ip_address"
    t.string   "address"
    t.string   "name"
    t.string   "email"
    t.string   "telephone"
    t.text     "description"
    t.string   "state",       :default => "offline"
  end

  create_table "photos", :force => true do |t|
    t.string   "poster",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "varieties", :force => true do |t|
    t.string   "en_name"
    t.string   "code"
    t.string   "ancestry"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "row_order"
    t.string   "se_name"
  end

  add_index "varieties", ["ancestry"], :name => "index_varieties_on_ancestry"

end
