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

ActiveRecord::Schema[8.0].define(version: 2025_03_31_052136) do
  create_table "course_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_sub_categories", force: :cascade do |t|
    t.string "name"
    t.integer "course_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_category_id"], name: "index_course_sub_categories_on_course_category_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_category_id", null: false
    t.integer "course_sub_category_id", null: false
    t.index ["course_category_id"], name: "index_reservations_on_course_category_id"
    t.index ["course_sub_category_id"], name: "index_reservations_on_course_sub_category_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string "name"
    t.integer "count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "course_sub_categories", "course_categories"
  add_foreign_key "reservations", "course_categories"
  add_foreign_key "reservations", "course_sub_categories"
end
