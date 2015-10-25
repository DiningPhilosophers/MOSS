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

ActiveRecord::Schema.define(version: 20151025051302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "user_name",       null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "group_size", null: false
    t.datetime "visit_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.integer  "person_id",   null: false
    t.integer  "question_id", null: false
    t.string   "answer",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "surveys", ["person_id", "question_id"], name: "ck_survey", unique: true, using: :btree

  create_table "visitors", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "group_id",   null: false
    t.string   "email"
    t.boolean  "contact",    null: false
    t.integer  "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "zip_code",   null: false
  end

  add_index "visitors", ["country_id"], name: "index_visitors_on_country_id", using: :btree
  add_index "visitors", ["group_id"], name: "index_visitors_on_group_id", using: :btree

  create_table "zipcodes", primary_key: "zip_code", force: :cascade do |t|
    t.string   "city",       null: false
    t.string   "county"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "zipcodes", ["zip_code"], name: "index_zipcodes_on_zip_code", unique: true, using: :btree

  add_foreign_key "visitors", "countries", name: "fk_country_id"
  add_foreign_key "visitors", "groups", name: "fk_group_id"
  add_foreign_key "visitors", "zipcodes", column: "zip_code", primary_key: "zip_code", name: "fk_zipcode"
end
