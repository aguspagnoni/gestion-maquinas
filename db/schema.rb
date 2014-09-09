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

ActiveRecord::Schema.define(version: 20140902210135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enabled"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "clients", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company_name"
    t.string   "cuit"
    t.string   "address"
    t.string   "telephone"
    t.string   "email"
  end

  create_table "failures", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "since"
    t.string   "details"
    t.integer  "client_id"
  end

  add_index "failures", ["client_id"], name: "index_failures_on_client_id", using: :btree

  create_table "habtm_relation_between_tech_and_repairs", force: true do |t|
  end

  create_table "locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_name"
    t.string   "address"
    t.integer  "client_id"
  end

  add_index "locations", ["client_id"], name: "index_locations_on_client_id", using: :btree

  create_table "machines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.string   "model"
    t.date     "active_since"
    t.integer  "category_id"
    t.integer  "position_id"
  end

  add_index "machines", ["category_id"], name: "index_machines_on_category_id", using: :btree
  add_index "machines", ["position_id"], name: "index_machines_on_position_id", using: :btree

  create_table "parts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.datetime "purchased_at"
    t.string   "provider"
    t.string   "description"
    t.integer  "repairment_id"
    t.integer  "count",         default: 1
    t.string   "provider_code"
    t.integer  "provider_id"
  end

  add_index "parts", ["provider_id"], name: "index_parts_on_provider_id", using: :btree
  add_index "parts", ["repairment_id"], name: "index_parts_on_repairment_id", using: :btree

  create_table "positions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  add_index "positions", ["location_id"], name: "index_positions_on_location_id", using: :btree

  create_table "providers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repairments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string   "state"
    t.text     "comment"
    t.integer  "machine_id"
  end

  add_index "repairments", ["machine_id"], name: "index_repairments_on_machine_id", using: :btree

  create_table "repairments_technicians", id: false, force: true do |t|
    t.integer "repairment_id", null: false
    t.integer "technician_id", null: false
  end

  add_index "repairments_technicians", ["repairment_id"], name: "index_repairments_technicians_on_repairment_id", using: :btree
  add_index "repairments_technicians", ["technician_id"], name: "index_repairments_technicians_on_technician_id", using: :btree

  create_table "services", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technicians", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "dni"
    t.string   "cuit"
    t.date     "birthdate"
    t.string   "email"
    t.string   "cellphone"
    t.string   "telephone"
    t.string   "address"
    t.integer  "repairment_id"
  end

  add_index "technicians", ["repairment_id"], name: "index_technicians_on_repairment_id", using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
