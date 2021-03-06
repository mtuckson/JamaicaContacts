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

ActiveRecord::Schema.define(version: 2019_11_02_175546) do

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email_address"
    t.string "postal_address"
    t.float "latitude"
    t.float "longitude"
    t.date "birth_date"
    t.boolean "baptism_status"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "alias"
    t.string "gender"
    t.integer "ecclesium_id"
    t.string "avatar"
    t.string "second_phone"
    t.string "third_phone"
    t.string "third_phone_description"
    t.string "second_phone_description"
    t.string "phone_description"
    t.index ["ecclesium_id"], name: "index_contacts_on_ecclesium_id"
  end

  create_table "ecclesia", force: :cascade do |t|
    t.string "name"
    t.string "postal_address"
    t.float "longitude"
    t.float "latitude"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "recording_brother_id"
    t.string "avatar"
    t.index ["recording_brother_id"], name: "index_ecclesia_on_recording_brother_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
