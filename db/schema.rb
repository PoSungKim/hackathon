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

ActiveRecord::Schema.define(version: 20180819105533) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "boards", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.boolean  "notice",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "menumatches", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "restaurant_name"
    t.integer  "menu_id"
    t.string   "menu_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["menu_id"], name: "index_menumatches_on_menu_id"
    t.index ["restaurant_id"], name: "index_menumatches_on_restaurant_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "menu_name"
    t.integer  "a1_maemil"
    t.integer  "a2_mil"
    t.integer  "a3_daedu"
    t.integer  "a4_hodu"
    t.integer  "a5_ddangkong"
    t.integer  "a6_peach"
    t.integer  "a7_tomato"
    t.integer  "a8_piggogi"
    t.integer  "a9_nanryu"
    t.integer  "a10_milk"
    t.integer  "a11_ddakgogi"
    t.integer  "a12_shoigogi"
    t.integer  "a13_saewoo"
    t.integer  "a14_godeungeoh"
    t.integer  "a15_honghap"
    t.integer  "a16_junbok"
    t.integer  "a17_gul"
    t.integer  "a18_jogaeryu"
    t.integer  "a19_gye"
    t.integer  "a20_ohjingeoh"
    t.integer  "a21_ahwangsan"
    t.string   "restaurant_name"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "new_alarms", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_new_alarms_on_user_id"
  end

  create_table "read_marks", force: :cascade do |t|
    t.string   "readable_type"
    t.integer  "readable_id"
    t.string   "reader_type"
    t.integer  "reader_id"
    t.datetime "timestamp"
    t.index ["readable_type", "readable_id"], name: "index_read_marks_on_readable_type_and_readable_id"
    t.index ["reader_id", "reader_type", "readable_type", "readable_id"], name: "read_marks_reader_readable_index", unique: true
    t.index ["reader_type", "reader_id"], name: "index_read_marks_on_reader_type_and_reader_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "restaurant_name"
    t.string   "zizum"
    t.string   "sido"
    t.string   "sigungu"
    t.string   "doromyeong"
    t.integer  "gunmul_bunho1"
    t.integer  "gunmul_bunho2"
    t.string   "phone_number"
    t.integer  "a1_maemil"
    t.integer  "a2_mil"
    t.integer  "a3_daedu"
    t.integer  "a4_hodu"
    t.integer  "a5_ddangkong"
    t.integer  "a6_peach"
    t.integer  "a7_tomato"
    t.integer  "a8_piggogi"
    t.integer  "a9_nanryu"
    t.integer  "a10_milk"
    t.integer  "a11_ddakgogi"
    t.integer  "a12_shoigogi"
    t.integer  "a13_saewoo"
    t.integer  "a14_godeungeoh"
    t.integer  "a15_honghap"
    t.integer  "a16_junbok"
    t.integer  "a17_gul"
    t.integer  "a18_jogaeryu"
    t.integer  "a19_gye"
    t.integer  "a20_ohjingeoh"
    t.integer  "a21_ahwangsan"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.string   "allergy"
    t.string   "gender",                 default: ""
    t.string   "ages"
    t.boolean  "admin",                  default: false
    t.boolean  "is_Brand",               default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "etc"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
