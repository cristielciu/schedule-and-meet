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

ActiveRecord::Schema.define(version: 2018_10_16_145512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.boolean "attempting", default: true
    t.string "user_name", default: ""
    t.integer "guests", default: 0
    t.string "user_ip", default: ""
    t.bigint "appointment_id"
    t.index ["appointment_id"], name: "index_answers_on_appointment_id"
    t.index ["user_ip", "appointment_id"], name: "index_answers_on_user_ip_and_appointment_id", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "starts_at"
    t.bigint "creator_id"
    t.string "url_token"
    t.index ["creator_id"], name: "index_appointments_on_creator_id"
    t.index ["url_token"], name: "index_appointments_on_url_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "facebook_api_key"
    t.string "group_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "appointments", "users", column: "creator_id"
end
