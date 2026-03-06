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

ActiveRecord::Schema[8.1].define(version: 2026_03_06_175506) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "extras", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "menu_item_id", null: false
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_extras_on_menu_item_id"
  end

  create_table "group_orders", force: :cascade do |t|
    t.string "bank_account"
    t.datetime "created_at", null: false
    t.bigint "created_by_id", null: false
    t.date "date"
    t.decimal "percentage_discount", precision: 5, scale: 2, default: "0.0"
    t.bigint "restaurant_id", null: false
    t.string "status"
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_group_orders_on_created_by_id"
    t.index ["restaurant_id"], name: "index_group_orders_on_restaurant_id"
  end

  create_table "individual_orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "group_order_id", null: false
    t.bigint "meal_id", null: false
    t.boolean "paid", default: false, null: false
    t.decimal "total", precision: 10, scale: 2
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["group_order_id", "user_id"], name: "index_individual_orders_on_group_order_id_and_user_id", unique: true
    t.index ["group_order_id"], name: "index_individual_orders_on_group_order_id"
    t.index ["meal_id"], name: "index_individual_orders_on_meal_id"
    t.index ["user_id"], name: "index_individual_orders_on_user_id"
  end

  create_table "meal_extras", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "extra_id", null: false
    t.bigint "meal_id", null: false
    t.datetime "updated_at", null: false
    t.index ["extra_id"], name: "index_meal_extras_on_extra_id"
    t.index ["meal_id", "extra_id"], name: "index_meal_extras_on_meal_id_and_extra_id", unique: true
    t.index ["meal_id"], name: "index_meal_extras_on_meal_id"
  end

  create_table "meal_toppings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "meal_id", null: false
    t.bigint "topping_id", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id", "topping_id"], name: "index_meal_toppings_on_meal_id_and_topping_id", unique: true
    t.index ["meal_id"], name: "index_meal_toppings_on_meal_id"
    t.index ["topping_id"], name: "index_meal_toppings_on_topping_id"
  end

  create_table "meals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "menu_item_id", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_meals_on_menu_item_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.bigint "restaurant_id", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_menu_items_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "toppings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "menu_item_id", null: false
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_toppings_on_menu_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "discarded_at"
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
  end

  add_foreign_key "extras", "menu_items"
  add_foreign_key "group_orders", "restaurants"
  add_foreign_key "group_orders", "users", column: "created_by_id"
  add_foreign_key "individual_orders", "group_orders"
  add_foreign_key "individual_orders", "meals"
  add_foreign_key "individual_orders", "users"
  add_foreign_key "meal_extras", "extras"
  add_foreign_key "meal_extras", "meals"
  add_foreign_key "meal_toppings", "meals"
  add_foreign_key "meal_toppings", "toppings"
  add_foreign_key "meals", "menu_items"
  add_foreign_key "menu_items", "restaurants"
  add_foreign_key "toppings", "menu_items"
end
