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

ActiveRecord::Schema.define(version: 2021_08_27_032733) do

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

  create_table "board_bookings", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "board_id", null: false
    t.bigint "booking_id", null: false
    t.index ["board_id"], name: "index_board_bookings_on_board_id"
    t.index ["booking_id"], name: "index_board_bookings_on_booking_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.integer "size"
    t.string "brand"
    t.integer "price"
    t.integer "guarantee_amount"
    t.string "contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.float "latitude"
    t.float "longitude"
    t.bigint "user_id"
    t.bigint "supplier_id"
    t.string "address"
    t.bigint "booking_id"
    t.string "shape"
    t.string "availability", default: "available"
    t.index ["booking_id"], name: "index_boards_on_booking_id"
    t.index ["supplier_id"], name: "index_boards_on_supplier_id"
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_on"
    t.datetime "end_on"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "pending"
    t.bigint "user_id", null: false
    t.bigint "board_id", null: false
    t.index ["board_id"], name: "index_bookings_on_board_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "contact"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "location"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "board_bookings", "boards"
  add_foreign_key "board_bookings", "bookings"
  add_foreign_key "boards", "bookings"
  add_foreign_key "boards", "suppliers"
  add_foreign_key "boards", "users"
  add_foreign_key "bookings", "boards"
  add_foreign_key "bookings", "users"
end
