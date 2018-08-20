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

ActiveRecord::Schema.define(version: 20180819075248) do

  create_table "allergies", force: :cascade do |t|
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
    t.integer  "restaurant_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image"
    t.index ["restaurant_id"], name: "index_allergies_on_restaurant_id"
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

  create_table "restaurants", force: :cascade do |t|
    t.string   "restaurant_name"
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

  create_table "zizuminfos", force: :cascade do |t|
    t.string   "zizum_name"
    t.string   "sido"
    t.string   "sigungu"
    t.string   "sangse_juso"
    t.string   "phone_number"
    t.string   "image"
    t.integer  "restaurant_id"
    t.string   "restaurant_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["restaurant_id"], name: "index_zizuminfos_on_restaurant_id"
  end

end
