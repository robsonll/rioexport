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

ActiveRecord::Schema.define(version: 20160602105219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "complete_name"
  end

  create_table "debit_notes", force: :cascade do |t|
    t.string   "bank_info"
    t.float    "total_ammount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "fixations", force: :cascade do |t|
    t.string   "fixed_lot"
    t.string   "average_price"
    t.string   "diferential"
    t.string   "final_price"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "sale_id"
    t.float    "customer_commission"
    t.float    "suplier_commission"
    t.float    "ptax"
    t.integer  "debit_note_id"
  end

  add_index "fixations", ["debit_note_id"], name: "index_fixations_on_debit_note_id", using: :btree
  add_index "fixations", ["sale_id"], name: "index_fixations_on_sale_id", using: :btree

  create_table "sales", force: :cascade do |t|
    t.string   "rioexport_contract"
    t.string   "suplier_contract"
    t.string   "customer_contract"
    t.integer  "bags_qty"
    t.string   "product_type"
    t.integer  "suplier_id"
    t.integer  "customer_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "shipping_co_id"
    t.string   "shipping_date"
    t.string   "price"
    t.string   "payment_type"
    t.string   "customer_com_desc"
    t.string   "suplier_com_desc"
  end

  add_index "sales", ["customer_id"], name: "index_sales_on_customer_id", using: :btree
  add_index "sales", ["suplier_id"], name: "index_sales_on_suplier_id", using: :btree

  create_table "shippings", force: :cascade do |t|
    t.string   "destination"
    t.string   "shipping_line"
    t.string   "daparture_terminal"
    t.string   "arriving_terminal"
    t.string   "special_conditions"
    t.string   "documents"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "sale_id"
  end

  add_index "shippings", ["sale_id"], name: "index_shippings_on_sale_id", using: :btree

  create_table "supliers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "complete_name"
    t.string   "cnpj"
    t.string   "inscr_est"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "fixations", "debit_notes"
  add_foreign_key "fixations", "sales"
  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "supliers"
  add_foreign_key "shippings", "sales"
end
