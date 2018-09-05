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

ActiveRecord::Schema.define(version: 2018_08_29_201115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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
    t.date "date", default: "2018-08-29", null: false
    t.string "hour", default: "15:09:26", null: false
    t.text "description", default: "N/A"
    t.string "folio"
    t.string "zip_code", default: "N/A"
    t.string "street", default: "N/A", null: false
    t.string "house_number", default: "N/A"
    t.string "colony", default: "N/A", null: false
    t.string "requester_name", default: "N/A"
    t.string "requester_lastname", default: "N/A"
    t.text "people_involved", default: [], array: true
    t.integer "user_id"
    t.integer "situation_id", null: false
    t.boolean "active", default: true
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone", "email"], name: "index_users_on_phone_and_email", unique: true
  end

  add_foreign_key "events", "requests"
  add_foreign_key "situations", "events"
end
