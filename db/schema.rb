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

ActiveRecord::Schema.define(version: 2018_08_17_093447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ride_offer_interests", force: :cascade do |t|
    t.bigint "ride_offer_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ride_offer_id"], name: "index_ride_offer_interests_on_ride_offer_id"
    t.index ["user_id"], name: "index_ride_offer_interests_on_user_id"
  end

  create_table "ride_offers", force: :cascade do |t|
    t.string "origin"
    t.string "destination"
    t.time "take_off"
    t.integer "no_of_people"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_ride_offers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "provider"
    t.string "name"
    t.string "email"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ride_offer_interests", "ride_offers"
  add_foreign_key "ride_offer_interests", "users"
  add_foreign_key "ride_offers", "users"
end
