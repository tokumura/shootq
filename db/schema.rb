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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140606053518) do

  create_table "bet_firsts", force: true do |t|
    t.string   "match_code"
    t.string   "score_l"
    t.string   "score_r"
    t.string   "group"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "match_date"
    t.string   "dayofweek"
    t.string   "match_time"
    t.string   "group_name"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "group"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "flag"
  end

  create_table "news_feeds", force: true do |t|
    t.string   "title"
    t.string   "news_url"
    t.string   "news_img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portals", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_infos", force: true do |t|
    t.string   "name"
    t.integer  "point_first"
    t.integer  "point_second"
    t.integer  "point_third"
    t.integer  "point_total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "voice"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "account"
  end

  add_index "users", ["account"], name: "index_users_on_account"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
