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

ActiveRecord::Schema.define(version: 2018_07_11_011523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "description", limit: 1024
    t.boolean "status", default: true, null: false
    t.string "code", limit: 16, null: false
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_events_on_code", unique: true
    t.index ["request_id"], name: "index_events_on_request_id"
  end

  create_table "reportes", force: :cascade do |t|
    t.date "date", default: "2018-08-02", null: false
    t.string "hour", default: "14:32:44", null: false
    t.text "description", default: "N/A", null: false
    t.text "attachments", default: [], array: true
    t.string "folio", null: false
    t.string "zip_code", default: "N/A", null: false
    t.string "street", default: "N/A", null: false
    t.string "house_number", default: "N/A"
    t.string "colony", default: "N/A", null: false
    t.string "requester_name", default: "N/A", null: false
    t.string "requester_lastname", default: "N/A", null: false
    t.text "people_involved", default: [], array: true
    t.integer "user_id"
    t.integer "situation_id", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["folio"], name: "index_reportes_on_folio", unique: true
  end

  create_table "requests", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "description", limit: 1024
    t.string "code", limit: 16, null: false
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_requests_on_code", unique: true
  end

  create_table "situations", force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "code", limit: 16, null: false
    t.string "description", limit: 1024
    t.boolean "status", default: true, null: false
    t.boolean "instantaneous", default: false, null: false
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_situations_on_code", unique: true
    t.index ["event_id"], name: "index_situations_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "lastname", limit: 128, null: false
    t.string "email", limit: 128, null: false
    t.string "phone", limit: 32, null: false
    t.string "address", limit: 256, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone", "email"], name: "index_users_on_phone_and_email", unique: true
  end

  add_foreign_key "events", "requests"
  add_foreign_key "situations", "events"
end
