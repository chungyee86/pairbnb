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

ActiveRecord::Schema.define(version: 20170403030459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "location"
    t.integer  "price"
    t.string   "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "room_type"
    t.integer  "no_of_guest"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "state"
    t.string   "country"
    t.json     "photos"
    t.string   "name"
    t.index ["user_id"], name: "index_listings_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "reservation_id"
    t.string   "braintree_payment_id"
    t.string   "status"
    t.string   "fourdigit"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["reservation_id"], name: "index_payments_on_reservation_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.date     "check_in"
    t.date     "check_out"
    t.integer  "user_id"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "num_guests"
  end

  create_table "usernames", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "email",                                      null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.integer  "phone"
    t.date     "birthdate"
    t.integer  "role",                           default: 0
    t.json     "avatars"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "listings", "users"
  add_foreign_key "reservations", "listings"
  add_foreign_key "reservations", "users"
end
