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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "group_size"
    t.datetime "visit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "question_id"
    t.string   "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "visitors", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "group_id"
    t.string   "email"
    t.boolean  "contact"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "zip_code",   null: false
  end

  add_index "visitors", ["country_id"], name: "index_visitors_on_country_id", using: :btree
  add_index "visitors", ["group_id"], name: "index_visitors_on_group_id", using: :btree

  create_table "zipcodes", primary_key: "zip_code", force: :cascade do |t|
    t.string   "city"
    t.string   "county"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "zipcodes", ["zip_code"], name: "index_zipcodes_on_zip_code", unique: true, using: :btree

  add_foreign_key "visitors", "countries", name: "fk_country_id"
  add_foreign_key "visitors", "groups", name: "fk_group_id"
  add_foreign_key "visitors", "zipcodes", column: "zip_code", primary_key: "zip_code", name: "fk_zipcode"
end
