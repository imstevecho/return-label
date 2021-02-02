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

ActiveRecord::Schema.define(version: 2021_02_02_135816) do

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "merchant_wallets", force: :cascade do |t|
    t.integer "merchant_id_id"
    t.integer "debit_amount"
    t.integer "credit_amount"
    t.integer "balance"
    t.string "detail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchant_id_id"], name: "index_merchant_wallets_on_merchant_id_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.integer "user_id_id", null: false
    t.string "name"
    t.string "phone_number"
    t.string "shipping_from_address"
    t.integer "wallet_balance_threshhold"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id_id"], name: "index_merchants_on_user_id_id"
  end

  create_table "purchase_items", force: :cascade do |t|
    t.integer "purchase_id", null: false
    t.integer "product_id", null: false
    t.string "sku"
    t.string "name"
    t.integer "unit_price"
    t.integer "order_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_purchase_items_on_product_id"
    t.index ["purchase_id"], name: "index_purchase_items_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "merchant_id", null: false
    t.integer "sub_total_amount"
    t.integer "tax_amount"
    t.integer "shipping_amount"
    t.string "total_amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_purchases_on_customer_id"
    t.index ["merchant_id"], name: "index_purchases_on_merchant_id"
  end

  create_table "refunds", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "purchase_id"
    t.integer "purchase_item_ids"
    t.integer "sub_total"
    t.integer "shipping_amount"
    t.integer "tax_amount"
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["purchase_id"], name: "index_refunds_on_purchase_id"
    t.index ["user_id"], name: "index_refunds_on_user_id"
  end

  create_table "shipping_labels", force: :cascade do |t|
    t.integer "refund_id"
    t.json "label_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["refund_id"], name: "index_shipping_labels_on_refund_id"
  end

  add_foreign_key "merchants", "user_ids"
  add_foreign_key "purchase_items", "products"
  add_foreign_key "purchase_items", "purchases"
  add_foreign_key "purchases", "customers"
  add_foreign_key "purchases", "merchants"
  add_foreign_key "refunds", "users"
end
