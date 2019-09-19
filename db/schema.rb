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

ActiveRecord::Schema.define(version: 2019_09_19_130510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "accus", force: :cascade do |t|
    t.bigint "central_device_id"
    t.datetime "application_date"
    t.datetime "livetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["central_device_id"], name: "index_accus_on_central_device_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.hstore "address_details"
    t.string "address_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alarm_settings", force: :cascade do |t|
    t.bigint "central_device_id"
    t.hstore "outputs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["central_device_id"], name: "index_alarm_settings_on_central_device_id"
  end

  create_table "central_devices", force: :cascade do |t|
    t.bigint "service_object_id"
    t.string "device_number", default: "0"
    t.string "serial_number"
    t.string "device_type"
    t.string "location"
    t.datetime "montage_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_object_id"], name: "index_central_devices_on_service_object_id"
  end

  create_table "contact_addresses", force: :cascade do |t|
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_contact_addresses_on_address_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_customers_on_address_id"
  end

  create_table "gas_types", force: :cascade do |t|
    t.string "name"
    t.string "chemical_formula"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "history_entries", force: :cascade do |t|
    t.bigint "central_device_id"
    t.text "entry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["central_device_id"], name: "index_history_entries_on_central_device_id"
  end

  create_table "object_maintenances", force: :cascade do |t|
    t.bigint "contact_address_id"
    t.bigint "service_object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_address_id"], name: "index_object_maintenances_on_contact_address_id"
    t.index ["service_object_id"], name: "index_object_maintenances_on_service_object_id"
  end

  create_table "output_devices", force: :cascade do |t|
    t.bigint "central_device_id"
    t.bigint "accu_id"
    t.string "device_type"
    t.string "location"
    t.datetime "montage_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count"
    t.index ["accu_id"], name: "index_output_devices_on_accu_id"
    t.index ["central_device_id"], name: "index_output_devices_on_central_device_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "sensor_types", force: :cascade do |t|
    t.string "name"
    t.decimal "default_min_value"
    t.decimal "default_max_value"
    t.datetime "default_livetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sensors", force: :cascade do |t|
    t.bigint "central_device_id"
    t.bigint "gas_type_id"
    t.bigint "sensor_type_id"
    t.bigint "si_unit_id"
    t.decimal "zero_point"
    t.decimal "min_value"
    t.decimal "max_value"
    t.datetime "application_date"
    t.datetime "livetime"
    t.decimal "alarm_point_1"
    t.decimal "alarm_point_2"
    t.decimal "alarm_point_3"
    t.decimal "alarm_point_4"
    t.string "location"
    t.string "number", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["central_device_id"], name: "index_sensors_on_central_device_id"
    t.index ["gas_type_id"], name: "index_sensors_on_gas_type_id"
    t.index ["sensor_type_id"], name: "index_sensors_on_sensor_type_id"
    t.index ["si_unit_id"], name: "index_sensors_on_si_unit_id"
  end

  create_table "service_objects", force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "customer_id"
    t.datetime "service_contract_begin"
    t.datetime "service_contract_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_contract_auto_resume_interval"
    t.index ["address_id", "customer_id"], name: "index_service_objects_on_address_id_and_customer_id", unique: true
    t.index ["address_id"], name: "index_service_objects_on_address_id"
    t.index ["customer_id"], name: "index_service_objects_on_customer_id"
  end

  create_table "si_units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "history_entries", "central_devices"
  add_foreign_key "output_devices", "accus"
  add_foreign_key "output_devices", "central_devices"
end
