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

ActiveRecord::Schema.define(:version => 20124024720498) do

  create_table "diseases", :force => true do |t|
    t.string "name"
    t.text   "symp"
    t.text   "signal"
    t.text   "defi"
    t.text   "factor"
    t.text   "divi"
  end

  create_table "doctors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "idcard"
    t.string   "skill"
    t.text     "introduction"
    t.string   "image_url"
    t.string   "username"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "email"
  end

  create_table "foods", :force => true do |t|
    t.integer "disease_id"
    t.text    "foodcontent"
  end

  create_table "informs", :force => true do |t|
    t.text     "content"
    t.string   "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "judgements", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "man_id"
    t.text     "content"
    t.string   "time_stamp"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "keywords", :force => true do |t|
    t.string "name"
  end

  create_table "medicines", :force => true do |t|
    t.string   "name"
    t.text     "factory"
    t.text     "indtruction"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "men", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "idcard"
    t.string   "real_name"
    t.integer  "doctor_id"
    t.string   "email"
    t.boolean  "isDoctor",        :default => false
  end

  create_table "news", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nodes", :force => true do |t|
    t.integer  "topics_count"
    t.text     "followers_ids"
    t.string   "name"
    t.integer  "section_id"
    t.text     "summary"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "powers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "psies", :force => true do |t|
    t.integer "disease_id"
    t.text    "psycontent"
  end

  create_table "replies", :force => true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "mentiond_user_ids"
    t.text     "liked_user_ids"
    t.text     "likes_count"
    t.integer  "message_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sports", :force => true do |t|
    t.integer "disease_id"
    t.text    "sportcontent"
  end

  create_table "teachers", :force => true do |t|
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

  add_index "teachers", ["email"], :name => "index_teachers_on_email", :unique => true
  add_index "teachers", ["reset_password_token"], :name => "index_teachers_on_reset_password_token", :unique => true

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "node_name"
    t.integer  "node_id"
    t.integer  "user_id"
    t.string   "who_delete"
    t.datetime "replied_at"
    t.integer  "last_reply_id"
    t.string   "last_reply_user_login"
    t.integer  "last_reply_user_id"
    t.integer  "replies_count",         :default => 0
    t.text     "mentioned_user_ids"
    t.text     "liked_user_ids"
    t.integer  "likes_count",           :default => 0
    t.text     "follower_ids"
    t.integer  "message_id"
    t.datetime "suggested_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
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
    t.string   "login"
    t.string   "name"
    t.string   "location"
    t.integer  "location_id"
    t.string   "company"
    t.text     "bio"
    t.text     "tagline"
    t.boolean  "verified"
    t.integer  "state"
    t.boolean  "guest"
    t.integer  "topics_count"
    t.integer  "replies_count"
    t.string   "private_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
