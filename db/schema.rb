# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_17_144622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "category"
    t.string "brightness"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "ownerships", force: :cascade do |t|
    t.bigint "plant_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "watering_frequency"
    t.datetime "start_time"
    t.index ["location_id"], name: "index_ownerships_on_location_id"
    t.index ["plant_id"], name: "index_ownerships_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "height"
    t.string "exposure"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "image"
    t.string "category"
    t.string "nickname"
    t.string "flowering"
    t.string "rusticity"
    t.string "real_exposure"
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

  create_table "waterings", force: :cascade do |t|
    t.date "start_time"
    t.bigint "ownership_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ownership_id"], name: "index_waterings_on_ownership_id"
  end

  add_foreign_key "locations", "users"
  add_foreign_key "ownerships", "locations"
  add_foreign_key "ownerships", "plants"
  add_foreign_key "waterings", "ownerships"
end
