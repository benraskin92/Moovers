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

ActiveRecord::Schema.define(version: 20150724104857) do

  create_table "bids", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "price"
    t.string   "company_name"
    t.string   "company_street"
    t.string   "company_city"
    t.string   "company_state"
    t.string   "company_zip"
    t.string   "company_phone"
    t.string   "company_email"
    t.integer  "post_id"
    t.integer  "user_id"
    t.string   "website"
  end

  add_index "bids", ["post_id"], name: "index_bids_on_post_id"
  add_index "bids", ["user_id"], name: "index_bids_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "fromstreet"
    t.string   "fromcity"
    t.string   "fromstate"
    t.string   "fromzip"
    t.string   "tostreet"
    t.string   "tocity"
    t.string   "tostate"
    t.string   "tozip"
    t.string   "bedrooms"
    t.boolean  "walkup"
    t.integer  "floor"
    t.date     "date"
    t.text     "notes"
    t.integer  "user_id"
    t.float    "from_lat"
    t.float    "from_long"
    t.float    "to_lat"
    t.float    "to_long"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "acct_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
