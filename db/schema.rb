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

ActiveRecord::Schema.define(version: 2020_12_16_051206) do

  create_table "attachments", force: :cascade do |t|
    t.integer "subject_time_id"
    t.string "name"
    t.binary "file"
    t.string "filetype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attend_managers", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "subject_time_id"
    t.datetime "expired"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attends", force: :cascade do |t|
    t.integer "subject_time_id"
    t.integer "user_id"
    t.integer "status"
    t.string "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ip"
  end

  create_table "course_registrations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.binary "icon"
    t.string "icontype"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
  end

  create_table "subject_profiles", force: :cascade do |t|
    t.integer "subject_id"
    t.binary "image"
    t.string "icontype"
    t.integer "teacher_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "subject_times", force: :cascade do |t|
    t.integer "subject_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public", default: false, null: false
    t.boolean "check", default: false, null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
