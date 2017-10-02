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

ActiveRecord::Schema.define(version: 20171002182011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_pessoas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.date "deliver_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "origins", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.date "load_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipment_vehicles", force: :cascade do |t|
    t.string "vtype"
    t.string "body_type"
    t.bigint "shipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shipment_id"], name: "index_shipment_vehicles_on_shipment_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.float "value"
    t.integer "weight_kg"
    t.bigint "contact_id"
    t.bigint "origin_id"
    t.bigint "destination_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_shipments_on_contact_id"
    t.index ["destination_id"], name: "index_shipments_on_destination_id"
    t.index ["origin_id"], name: "index_shipments_on_origin_id"
  end

  create_table "truckers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "last_city"
    t.string "last_state"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_truckers_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vtype"
    t.string "body_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "shipment_vehicles", "shipments"
  add_foreign_key "shipments", "contacts"
  add_foreign_key "shipments", "destinations"
  add_foreign_key "shipments", "origins"
  add_foreign_key "truckers", "vehicles"
end
