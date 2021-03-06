# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_29_180600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string "business_type"
    t.string "name"
    t.string "address"
    t.string "street"
    t.string "unit"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "phone"
    t.string "website"
    t.integer "sqft"
    t.text "description"
    t.string "naics"
    t.string "women"
    t.string "minority"
    t.string "black"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "about"
    t.bigint "subcategory_id"
    t.string "su_open"
    t.string "su_close"
    t.string "mo_open"
    t.string "mo_close"
    t.string "tu_open"
    t.string "tu_close"
    t.string "we_open"
    t.string "we_close"
    t.string "th_open"
    t.string "th_close"
    t.string "fr_open"
    t.string "fr_close"
    t.string "sa_open"
    t.string "sa_close"
    t.string "phone_ext"
    t.string "email"
    t.index ["subcategory_id"], name: "index_businesses_on_subcategory_id"
  end

  create_table "businesses_people", id: false, force: :cascade do |t|
    t.bigint "business_id", null: false
    t.bigint "person_id", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "mid_name"
    t.string "last_name"
    t.string "alias"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "phone"
    t.string "phone_ext"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "servicings", force: :cascade do |t|
    t.string "description"
    t.bigint "business_id"
    t.bigint "service_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_servicings_on_business_id"
    t.index ["service_id"], name: "index_servicings_on_service_id"
  end

  create_table "socials", force: :cascade do |t|
    t.string "site"
    t.string "url"
    t.bigint "business_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_socials_on_business_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  add_foreign_key "businesses", "subcategories"
  add_foreign_key "socials", "businesses"
end
