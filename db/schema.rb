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

ActiveRecord::Schema.define(version: 2018_04_26_175739) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.string "external_urls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.decimal "price", default: "0.0"
    t.integer "quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.string "shipping_address"
    t.text "notes"
    t.decimal "shipment_total", default: "0.0"
    t.decimal "adjustment_total", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state", default: 0
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.decimal "price", default: "0.0"
    t.text "description"
    t.string "external_urls"
    t.integer "count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.integer "supplier_id"
    t.text "notes"
    t.decimal "shipment_total", default: "0.0"
    t.decimal "adjustment_total", default: "0.0"
    t.integer "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_purchase_orders_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "address"
    t.string "external_urls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
