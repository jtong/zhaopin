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

ActiveRecord::Schema.define(:version => 20130303023300) do

  create_table "exam_papers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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

  create_table "my_exams", :force => true do |t|
    t.integer  "user_id"
    t.float    "score"
    t.integer  "time_cost"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "my_questions", :force => true do |t|
    t.integer  "my_exam_id"
    t.string   "name"
    t.string   "content"
    t.string   "answer"
    t.string   "user_post"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "my_questions", ["my_exam_id"], :name => "index_my_questions_on_my_exam_id"

  create_table "question_of_exam_papers", :force => true do |t|
    t.integer  "question_template_id"
    t.integer  "exam_paper_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "question_of_exam_papers", ["exam_paper_id"], :name => "index_question_of_exam_papers_on_exam_paper_id"
  add_index "question_of_exam_papers", ["question_template_id"], :name => "index_question_of_exam_papers_on_question_template_id"

  create_table "question_templates", :force => true do |t|
    t.string   "js_file"
    t.string   "template_file"
    t.string   "view_file"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "name"
  end

end
