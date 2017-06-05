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

ActiveRecord::Schema.define(version: 20170604163340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "siteName", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "streetAddress"
    t.string "city"
    t.string "state"
    t.integer "zip5"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_addresses_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "locationName", null: false
    t.date "arriveDate", null: false
    t.time "arriveTime", null: false
    t.integer "duration", null: false
    t.integer "milesSinceLast", null: false
    t.string "purpose", null: false
    t.string "secondaryPurpose"
    t.boolean "overnight", default: false
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_locations_on_trip_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.string "payee"
    t.date "receiptDate"
    t.string "location"
    t.float "amount"
    t.string "memo"
    t.string "category"
    t.boolean "reimbursable"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_receipts_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "travelers", null: false
    t.date "departDate", null: false
    t.time "departTime", null: false
    t.date "returnDate"
    t.time "returnTime"
    t.integer "numNights", null: false
    t.float "totalCost", default: 0.0
    t.float "totalMileage", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

end
