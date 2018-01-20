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

ActiveRecord::Schema.define(version: 20180120050849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "time"
    t.integer "guest_count"
    t.bigint "tables_id"
    t.bigint "guests_id"
    t.index ["guests_id"], name: "index_reservations_on_guests_id"
    t.index ["tables_id"], name: "index_reservations_on_tables_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.string "opening_time"
    t.string "closing_time"
    t.bigint "restaurants_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["restaurants_id"], name: "index_shifts_on_restaurants_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "name"
    t.integer "min_guest"
    t.integer "max_guest"
    t.bigint "restaurants_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurants_id"], name: "index_tables_on_restaurants_id"
  end

end
