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

ActiveRecord::Schema.define(version: 20171107052049) do

  create_table "attendances", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credits", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "oil_type"
    t.float    "rate"
    t.float    "litres"
    t.float    "amount"
    t.date     "purchase_date"
    t.boolean  "is_paid",       default: false
    t.date     "paid_date"
    t.float    "cash_paid",     default: 0.0
    t.integer  "daily_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

# Could not dump table "customers" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "dailies", force: :cascade do |t|
    t.float    "d1"
    t.float    "d2"
    t.float    "p1"
    t.float    "p2"
    t.integer  "oil"
    t.date     "daily_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "petrol_price"
    t.float    "diesel_price"
    t.float    "total"
  end

  create_table "readings", force: :cascade do |t|
    t.float    "d"
    t.float    "p"
    t.integer  "daily_id"
    t.date     "daily_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "diesel_price"
    t.float    "petrol_price"
    t.float    "oil"
    t.float    "total_diesel"
    t.float    "total_petrol"
    t.float    "total"
  end

  create_table "sales", force: :cascade do |t|
    t.float    "diesel"
    t.float    "petrol"
    t.float    "diesel_price"
    t.float    "petrol_price"
    t.float    "oil"
    t.date     "reading_date"
    t.integer  "daily_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "total"
  end

end
