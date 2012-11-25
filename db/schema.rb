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

ActiveRecord::Schema.define(:version => 20123024720491) do

  create_table "diseases", :force => true do |t|
    t.string   "name"
    t.text     "symp"
    t.text     "signal"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "defi"
    t.text     "factor"
    t.text     "divi"
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

end
