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

ActiveRecord::Schema.define(version: 20180225231230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "family_histories", force: :cascade do |t|
    t.text "name"
  end

  create_table "health_maintenances", force: :cascade do |t|
    t.string "name"
  end

  create_table "immunizations", force: :cascade do |t|
    t.string "name"
  end

  create_table "medical_histories", force: :cascade do |t|
    t.text "name"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "name"
    t.string "dosage"
    t.string "frequency"
    t.text "note"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
  end

  create_table "surgical_histories", force: :cascade do |t|
    t.text "name"
    t.bigint "user_id"
    t.date "date"
    t.text "location"
    t.text "physician"
    t.index ["user_id"], name: "index_surgical_histories_on_user_id"
  end

  create_table "user_family_histories", force: :cascade do |t|
    t.text "note"
    t.bigint "user_id"
    t.bigint "family_history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_history_id"], name: "index_user_family_histories_on_family_history_id"
    t.index ["user_id"], name: "index_user_family_histories_on_user_id"
  end

  create_table "user_health_maintenances", force: :cascade do |t|
    t.text "note"
    t.date "date"
    t.bigint "user_id"
    t.bigint "health_maintenance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_maintenance_id"], name: "index_user_health_maintenances_on_health_maintenance_id"
    t.index ["user_id"], name: "index_user_health_maintenances_on_user_id"
  end

  create_table "user_immunization_histories", force: :cascade do |t|
    t.text "note"
    t.date "date"
    t.bigint "user_id"
    t.bigint "immunization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["immunization_id"], name: "index_user_immunization_histories_on_immunization_id"
    t.index ["user_id"], name: "index_user_immunization_histories_on_user_id"
  end

  create_table "user_medical_histories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "medical_history_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.index ["medical_history_id"], name: "index_user_medical_histories_on_medical_history_id"
    t.index ["user_id"], name: "index_user_medical_histories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "prescriptions", "users"
  add_foreign_key "user_family_histories", "family_histories"
  add_foreign_key "user_family_histories", "users"
  add_foreign_key "user_health_maintenances", "health_maintenances"
  add_foreign_key "user_health_maintenances", "users"
  add_foreign_key "user_immunization_histories", "immunizations"
  add_foreign_key "user_immunization_histories", "users"
  add_foreign_key "user_medical_histories", "medical_histories"
  add_foreign_key "user_medical_histories", "users"
end
