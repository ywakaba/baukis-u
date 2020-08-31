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

ActiveRecord::Schema.define(version: 2020_08_29_232620) do

  create_table "administrators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "email_for_index", null: false
    t.string "hashed_password"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_for_index"], name: "index_administrators_on_email_for_index", unique: true
  end

  create_table "staff_events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "staff_member_id", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.index ["created_at"], name: "index_staff_events_on_created_at", unique: true
    t.index ["staff_member_id", "created_at"], name: "index_staff_events_on_staff_member_id_and_created_at"
    t.index ["staff_member_id"], name: "index_staff_events_on_staff_member_id"
  end

  create_table "staff_members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "email_for_index", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.string "hashed_password"
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "suspended", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_for_index"], name: "index_staff_members_on_email_for_index", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_staff_members_on_family_name_kana_and_given_name_kana"
  end

  add_foreign_key "staff_events", "staff_members"
end
