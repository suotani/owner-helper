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

ActiveRecord::Schema.define(version: 2019_02_19_001806) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "account"
    t.string "email"
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
  end

end
