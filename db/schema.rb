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

ActiveRecord::Schema.define(version: 2019_02_25_015033) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bill_details", force: :cascade do |t|
    t.integer "bill_id"
    t.integer "house_id"
    t.integer "moving_count"
    t.integer "moving_amount"
    t.integer "leave_count", default: 0
    t.integer "new_moving_count", default: 0
    t.integer "days_amount"
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "year"
    t.integer "month"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_chats", force: :cascade do |t|
    t.integer "contact_id"
    t.text "text"
    t.integer "owner_id"
    t.integer "resident_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "read_status", default: 2
    t.text "other_language_text"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "room_id"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "resident_id"
    t.integer "owner_status", default: 2
    t.integer "resident_status", default: 2
    t.datetime "last_wrote_at"
  end

  create_table "demos", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foreign_posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.integer "post_id"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "houses", force: :cascade do |t|
    t.integer "owner_id"
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "postal_code", limit: 7
    t.integer "price"
  end

  create_table "inquiries", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "resident_id"
    t.text "text"
    t.string "email"
    t.integer "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "phone_number"
    t.string "response_time"
    t.integer "contact_mail_setting", default: 2
    t.integer "request_mail_setting", default: 2
    t.string "language", default: "ja"
    t.integer "invitation_owner_id"
    t.string "invitation_code"
    t.index ["email"], name: "index_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true
  end

  create_table "post_houses", force: :cascade do |t|
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "house_id"
  end

  create_table "post_residents", force: :cascade do |t|
    t.integer "post_id"
    t.integer "resident_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "read_status", default: 2
  end

  create_table "posts", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.string "title"
    t.datetime "post_at"
    t.datetime "end_at"
    t.integer "end_option"
    t.boolean "deleted", default: false
  end

  create_table "residents", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "family"
    t.string "name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "status", default: 1
    t.integer "post_mail_setting", default: 2
    t.integer "contact_mail_setting", default: 2
    t.string "language"
    t.string "name_kana"
    t.index ["email"], name: "index_residents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_residents_on_reset_password_token", unique: true
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "house_id"
    t.string "number"
    t.integer "resident_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "request"
    t.datetime "requested_at"
    t.integer "contact_id"
    t.datetime "moved_at"
    t.datetime "leave_at"
    t.string "resident_name"
    t.string "resident_phone_number"
    t.string "resident_name_kana"
  end

end
