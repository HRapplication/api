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

ActiveRecord::Schema.define(version: 20170508141747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.string   "postcode"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "addresses", ["employee_id"], name: "index_addresses_on_employee_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "business_trip_forms", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "company"
    t.string   "transport"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "business_trip_forms", ["employee_id"], name: "index_business_trip_forms_on_employee_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "phone_number"
    t.integer  "position"
    t.integer  "weekly_working_hours"
    t.integer  "supervisor_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "enlisted_for_events", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "enlisted_for_events", ["employee_id"], name: "index_enlisted_for_events_on_employee_id", using: :btree
  add_index "enlisted_for_events", ["event_id"], name: "index_enlisted_for_events_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "events_contents", force: :cascade do |t|
    t.text     "content"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events_contents", ["event_id"], name: "index_events_contents_on_event_id", using: :btree

  create_table "holiday_forms", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "holiday_type"
    t.text     "comment"
    t.integer  "employee_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "holiday_forms", ["employee_id"], name: "index_holiday_forms_on_employee_id", using: :btree

  create_table "homeoffice_forms", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "homeoffice_forms", ["employee_id"], name: "index_homeoffice_forms_on_employee_id", using: :btree

  create_table "job_offers", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "job_offers", ["user_id"], name: "index_job_offers_on_user_id", using: :btree

  create_table "offers_contents", force: :cascade do |t|
    t.text     "content"
    t.integer  "job_offer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "offers_contents", ["job_offer_id"], name: "index_offers_contents_on_job_offer_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.date     "work_date"
    t.time     "start_hour"
    t.time     "end_gour"
    t.boolean  "is_weekend"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "schedules", ["employee_id"], name: "index_schedules_on_employee_id", using: :btree

  create_table "sick_leave_forms", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "care_type"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sick_leave_forms", ["employee_id"], name: "index_sick_leave_forms_on_employee_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "employee_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["employee_id"], name: "index_users_on_employee_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "employees"
  add_foreign_key "business_trip_forms", "employees"
  add_foreign_key "enlisted_for_events", "employees"
  add_foreign_key "enlisted_for_events", "events"
  add_foreign_key "events", "users"
  add_foreign_key "events_contents", "events"
  add_foreign_key "holiday_forms", "employees"
  add_foreign_key "homeoffice_forms", "employees"
  add_foreign_key "job_offers", "users"
  add_foreign_key "offers_contents", "job_offers"
  add_foreign_key "schedules", "employees"
  add_foreign_key "sick_leave_forms", "employees"
  add_foreign_key "users", "employees"
end
