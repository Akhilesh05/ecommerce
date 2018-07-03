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

ActiveRecord::Schema.define(version: 2018_07_03_074228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "full_name", limit: 100
    t.string "line1"
    t.string "line2"
    t.string "zip_code", limit: 20
    t.string "city", limit: 50
    t.string "country", limit: 2
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.bigint "product_id"
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "price_changes", force: :cascade do |t|
    t.bigint "product_id"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_price_changes_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "brand_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 50
    t.string "last_name", limit: 50
    t.string "nic_number", limit: 14
    t.string "passport_country_number", limit: 20
    t.string "nationality", limit: 2
    t.string "mobile_number", limit: 8
    t.string "email", limit: 100
    t.string "password_digest", limit: 128
    t.string "password_salt", limit: 64
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mobile_number"], name: "index_users_on_mobile_number"
    t.index ["nic_number"], name: "index_users_on_nic_number", unique: true
    t.index ["passport_country_number"], name: "index_users_on_passport_country_number", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "images", "products"
  add_foreign_key "price_changes", "products"
  add_foreign_key "products", "brands"
end
