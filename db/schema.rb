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

ActiveRecord::Schema.define(version: 2020_01_22_113953) do

  create_table "carriers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "distance_units", force: :cascade do |t|
    t.string "key"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mass_units", force: :cascade do |t|
    t.string "key"
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "tracking_number"
    t.float "label_length", default: 0.0, null: false
    t.float "label_width", default: 0.0, null: false
    t.float "label_height", default: 0.0, null: false
    t.float "label_weight", default: 0.0, null: false
    t.float "label_total_weight", default: 0.0, null: false
    t.integer "carrier_id", null: false
    t.integer "label_distance_unit_id", null: false
    t.integer "label_mass_unit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carrier_id"], name: "index_packages_on_carrier_id"
    t.index ["label_distance_unit_id"], name: "index_packages_on_label_distance_unit_id"
    t.index ["label_mass_unit_id"], name: "index_packages_on_label_mass_unit_id"
  end

  create_table "real_measures", force: :cascade do |t|
    t.integer "package_id", null: false
    t.float "real_length", default: 0.0, null: false
    t.float "real_width", default: 0.0, null: false
    t.float "real_height", default: 0.0, null: false
    t.float "real_weight", default: 0.0, null: false
    t.float "real_total_weight", default: 0.0, null: false
    t.integer "real_distance_unit_id"
    t.integer "real_mass_unit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["package_id"], name: "index_real_measures_on_package_id"
    t.index ["real_distance_unit_id"], name: "index_real_measures_on_real_distance_unit_id"
    t.index ["real_mass_unit_id"], name: "index_real_measures_on_real_mass_unit_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "packages", "carriers"
  add_foreign_key "packages", "distance_units", column: "label_distance_unit_id"
  add_foreign_key "packages", "mass_units", column: "label_mass_unit_id"
  add_foreign_key "real_measures", "distance_units", column: "real_distance_unit_id"
  add_foreign_key "real_measures", "mass_units", column: "real_mass_unit_id"
  add_foreign_key "real_measures", "packages"
end
