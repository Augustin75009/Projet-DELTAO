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

ActiveRecord::Schema.define(version: 2020_02_19_114522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "product_id"
    t.integer "quantity", default: 1
    t.bigint "lesson_id"
    t.string "slot"
    t.bigint "slot_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["lesson_id"], name: "index_cart_items_on_lesson_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
    t.index ["slot_id"], name: "index_cart_items_on_slot_id"
    t.index ["user_id"], name: "index_cart_items_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents"
    t.string "gift", default: ""
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "photo"
    t.text "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "link"
    t.integer "priority", default: 1
    t.string "alt", default: "Atelier de céramique paris 18"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "state"
    t.string "product_sku"
    t.string "gift_to"
    t.string "gift_from"
    t.jsonb "payment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_gifts_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "quantity"
    t.string "photo"
    t.integer "price_cents", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.boolean "adult", default: false
    t.boolean "child", default: false
    t.boolean "phone_booking", default: false
    t.boolean "payable", default: false
    t.boolean "gift_card", default: false
    t.text "card_description"
    t.text "pricing"
    t.bigint "user_id"
    t.string "slot", array: true
    t.text "schedule"
    t.integer "deposit", default: 0, null: false
    t.string "pic_position", default: "center"
    t.string "alt", default: "Atelier de céramique paris 18"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "quantity"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.integer "price_cents", default: 0, null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.string "state"
    t.string "product_sku"
    t.jsonb "payment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount_cents", default: 0, null: false
    t.string "slot", array: true
    t.string "gift_to"
    t.string "gift_from"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "signatures", force: :cascade do |t|
    t.datetime "date"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signatures_students", id: false, force: :cascade do |t|
    t.integer "signature_id"
    t.integer "student_id"
  end

  create_table "slots", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.index ["lesson_id"], name: "index_slots_on_lesson_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "address"
    t.string "city"
    t.integer "zip"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "teachings", force: :cascade do |t|
    t.string "title"
    t.string "header"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_teachings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "address"
    t.string "city"
    t.integer "zip"
    t.string "phone"
    t.string "adminkey"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "lessons"
  add_foreign_key "cart_items", "products"
  add_foreign_key "cart_items", "slots"
  add_foreign_key "cart_items", "users"
  add_foreign_key "carts", "users"
  add_foreign_key "events", "users"
  add_foreign_key "gifts", "users"
  add_foreign_key "lessons", "users"
  add_foreign_key "purchases", "users"
  add_foreign_key "slots", "lessons"
  add_foreign_key "teachings", "users"
end
