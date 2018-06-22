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

ActiveRecord::Schema.define(version: 2018_06_21_231734) do

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

  create_table "requests", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "description", limit: 1024
    t.string "code", limit: 16, null: false
    t.boolean "status", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_requests_on_code", unique: true
  end

  add_foreign_key "events", "requests"
end