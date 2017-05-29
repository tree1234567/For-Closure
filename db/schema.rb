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

ActiveRecord::Schema.define(version: 20170527220035) do

  create_table "categories", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "hometype_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories", ["hometype_id"], name: "index_categories_on_hometype_id"
  add_index "categories", ["property_id"], name: "index_categories_on_property_id"

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "favorites", ["property_id"], name: "index_favorites_on_property_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "home_types", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string   "address"
    t.integer  "bedroom"
    t.float    "bathroom"
    t.integer  "zipcode"
    t.decimal  "price"
    t.integer  "square_feet"
    t.string   "unit"
    t.boolean  "rent"
    t.text     "description"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "user_id"
    t.integer  "type_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "properties", ["type_id"], name: "index_properties_on_type_id"
  add_index "properties", ["user_id"], name: "index_properties_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone_number"
    t.boolean  "agent"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
