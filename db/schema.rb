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

ActiveRecord::Schema.define(version: 20150923085441) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "distributions", force: true do |t|
    t.string   "no_publications"
    t.text     "preferred1"
    t.datetime "distribution_date"
    t.text     "misc_information"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "press_release_id"
    t.string   "preferred2"
    t.string   "preferred3"
    t.string   "preferred4"
    t.string   "preferred5"
  end

  create_table "fundings", force: true do |t|
    t.string   "investment_type"
    t.datetime "date"
    t.string   "name"
    t.string   "sum"
    t.integer  "press_room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.integer  "press_release_id"
    t.string   "link"
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.text     "presentation"
    t.integer  "press_room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "press_release_fields", force: true do |t|
    t.string   "name"
    t.string   "field_type"
    t.boolean  "required",              default: false
    t.integer  "press_release_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "question"
    t.text     "example"
    t.text     "tip"
    t.text     "prefill"
  end

  add_index "press_release_fields", ["press_release_type_id"], name: "index_press_release_fields_on_press_release_type_id"

  create_table "press_release_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "question"
    t.string   "example"
    t.string   "tip"
    t.string   "prefill"
    t.integer  "category_id"
    t.text     "description"
  end

  create_table "press_releases", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "hex"
    t.boolean  "exclusive",             default: true
    t.datetime "embargo"
    t.integer  "press_room_id"
    t.integer  "press_release_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "properties"
  end

  create_table "press_rooms", force: true do |t|
    t.string   "company_name"
    t.string   "twitter"
    t.string   "phone"
    t.datetime "founded"
    t.string   "website"
    t.string   "press_email"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "slug"
    t.boolean  "admin",                  default: false, null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "term_agreement"
    t.text     "problem_solved"
    t.text     "business_model"
    t.text     "competition"
  end

  add_index "press_rooms", ["email"], name: "index_press_rooms_on_email", unique: true
  add_index "press_rooms", ["reset_password_token"], name: "index_press_rooms_on_reset_password_token", unique: true
  add_index "press_rooms", ["slug"], name: "index_press_rooms_on_slug", unique: true

  create_table "questions", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: true do |t|
    t.string   "caption"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "press_release_id"
  end

end
