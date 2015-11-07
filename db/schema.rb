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

ActiveRecord::Schema.define(version: 20151009013532) do

  create_table "admins", force: :cascade do |t|
    t.string   "user_name",       limit: 255, null: false
    t.string   "password_digest", limit: 255, null: false
    t.string   "remember_digest", limit: 255
    t.string   "reset_digest",    limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "group_size",       limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "question", limit: 65535, null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "group_id",  limit: 4,   null: false
    t.integer "question_id", limit: 4,   null: false
    t.string  "answer",      limit: 255, null: false
  end

  create_table "texas_zipcodes", id: false, force: :cascade do |t|
    t.string "zipcode", limit: 255, null: false
    t.string "city",    limit: 255, null: false
    t.string "county",  limit: 255, null: false
  end

  create_table "visitors", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.integer  "group_id",   limit: 4,   null: false
    t.string   "email",      limit: 255
    t.boolean  "contact"
    t.string   "zip_code",    limit: 255, null: false
    t.integer  "country_id", limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "zipcodes", id: false, force: :cascade do |t|
    t.string "zipcode", limit: 255, null: false
    t.string "city",    limit: 255, null: false
    t.string "state",   limit: 255, null: false
  end

  add_index "zipcodes", ["zipcode"], name: "index_zipcodes_on_zipcode", unique: true, using: :btree
  add_index "zipcodes", ["zipcode"], name: "pk_zipcode", unique: true, using: :btree

end
