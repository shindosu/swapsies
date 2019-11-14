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

ActiveRecord::Schema.define(version: 2019_11_14_015408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "console"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_image"
    t.float "rating"
    t.date "release_date"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "game_id"
    t.string "condition"
    t.string "status", default: "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_listings_on_game_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "swaps", force: :cascade do |t|
    t.bigint "listing_offered_id"
    t.bigint "listing_requested_id"
    t.string "status"
    t.boolean "offered_recieved"
    t.boolean "requested_recieved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_offered_id"], name: "index_swaps_on_listing_offered_id"
    t.index ["listing_requested_id"], name: "index_swaps_on_listing_requested_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "city"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "listings", "games"
  add_foreign_key "listings", "users"
  add_foreign_key "swaps", "listings", column: "listing_offered_id"
  add_foreign_key "swaps", "listings", column: "listing_requested_id"
end
