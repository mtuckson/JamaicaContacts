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

ActiveRecord::Schema.define(version: 2019_09_23_020225) do

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
    t.index ["ecclesium_id"], name: "index_contacts_on_ecclesium_id"
  end

  create_table "ecclesia", force: :cascade do |t|
    t.string "name"
    t.string "postal_address"
    t.float "longitude"
    t.float "latitude"
    t.text "notes"
    t.integer "recording_brother"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "recording_brother_id"
    t.index ["recording_brother_id"], name: "index_ecclesia_on_recording_brother_id"
  end

end
