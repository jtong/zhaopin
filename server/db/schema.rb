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

ActiveRecord::Schema.define(:version => 20130301090128) do

  create_table "moode_user_plugin_data_auths", :force => true do |t|
    t.integer  "level"
    t.string   "name"
    t.integer  "data_authorizable_id"
    t.string   "data_authorizable_type"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "accessor_authorizable_id"
    t.string   "accessor_authorizable_type"
  end

  create_table "moode_user_plugin_users", :force => true do |t|
    t.string   "username"
    t.string   "display_name"
    t.string   "email"
    t.string   "password"
    t.string   "token"
    t.string   "phone"
    t.boolean  "admin",        :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "moode_user_plugin_verify_codes", :force => true do |t|
    t.string   "code"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "question_templates", :force => true do |t|
    t.string   "js_file"
    t.string   "template_file"
    t.string   "view_file"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "name"
  end

end
