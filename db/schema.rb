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

ActiveRecord::Schema.define(version: 2021_05_25_042949) do

  create_table "foods", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "food_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchase_order_items", charset: "utf8", force: :cascade do |t|
    t.bigint "purchase_order_id"
    t.bigint "food_id", null: false
    t.float "count", default: 1.0
    t.string "unit", default: "gram"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_purchase_order_items_on_food_id"
    t.index ["purchase_order_id"], name: "index_purchase_order_items_on_purchase_order_id"
  end

  create_table "purchase_orders", charset: "utf8", force: :cascade do |t|
    t.string "address", null: false
    t.string "city", default: "Melbourne"
    t.string "customer_name", null: false
    t.string "username", null: false
    t.string "state", default: "Victoira", null: false
    t.string "country", default: "Austalia", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
    t.index ["username"], name: "index_purchase_orders_on_username"
  end

  create_table "recipe_foods", charset: "utf8", force: :cascade do |t|
    t.bigint "recipe_id"
    t.bigint "food_id"
    t.float "count", default: 1.0
    t.string "unit", default: "grams"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_id"], name: "index_recipe_foods_on_food_id"
    t.index ["recipe_id"], name: "index_recipe_foods_on_recipe_id"
  end

  create_table "recipes", charset: "utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "purchase_order_items", "foods"
  add_foreign_key "purchase_order_items", "purchase_orders"
end
