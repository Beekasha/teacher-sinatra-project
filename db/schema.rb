# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20200319022914) do

  create_table "klasses", force: :cascade do |t|
    t.string  "name"
    t.integer "period"
    t.integer "teacher_id"
  end

  create_table "klasses_students", force: :cascade do |t|
    t.integer "student_id"
    t.integer "klass_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string  "name"
    t.integer "grade"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
  end

end
