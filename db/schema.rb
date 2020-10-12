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

ActiveRecord::Schema.define(version: 2020_09_28_112615) do

  create_table "users", force: :cascade do |t|
    t.string "hash_id", limit: 36, null: false
    t.string "email", limit: 320
    t.string "encrypted_password"
    t.string "role", default: "user", null: false
    t.string "locale", default: "en", null: false
    t.boolean "deleted", default: false, null: false
    t.boolean "blocked", default: false, null: false
    t.string "blocked_reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "event", null: false
    t.string "model", null: false
    t.integer "model_id", null: false
    t.integer "editor_id"
    t.text "fields_changed", limit: 4294967295
    t.text "body", limit: 4294967295
    t.datetime "created_at"
  end

end
