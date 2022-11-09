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

ActiveRecord::Schema[7.0].define(version: 2022_11_08_182124) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "frames", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "status", default: "Active"
    t.float "price"
    t.string "price_currency", default: "USD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stock", default: 0
  end

  create_table "glasses", force: :cascade do |t|
    t.integer "frame_id"
    t.integer "lense_id"
    t.integer "shoplist_id"
    t.integer "user_id"
    t.float "price"
    t.string "price_currency", default: "USD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lenses", force: :cascade do |t|
    t.string "colour"
    t.text "description"
    t.string "prescription_type"
    t.string "lens_type"
    t.integer "stock"
    t.float "price"
    t.string "price_currency", default: "USD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoplists", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shoplists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "user_currency", default: "USD"
    t.string "role", default: "user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "shoplists", "users"
end
