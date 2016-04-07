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

ActiveRecord::Schema.define(version: 20160401150100) do

  create_table "available_accounts", force: :cascade do |t|
    t.integer  "bank_id"
    t.integer  "bank_account_type_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "available_accounts", ["bank_account_type_id"], name: "index_available_accounts_on_bank_account_type_id"
  add_index "available_accounts", ["bank_id"], name: "index_available_accounts_on_bank_id"

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_account_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "bank_id"
    t.integer  "bank_account_type_id"
    t.integer  "profile_id"
    t.string   "number"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "bank_accounts", ["bank_account_type_id"], name: "index_bank_accounts_on_bank_account_type_id"
  add_index "bank_accounts", ["bank_id"], name: "index_bank_accounts_on_bank_id"
  add_index "bank_accounts", ["profile_id"], name: "index_bank_accounts_on_profile_id"

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "length"
    t.integer  "calendar_id"
    t.integer  "profile_id"
    t.integer  "service_id"
    t.string   "payment_id"
    t.integer  "profile_service_id"
    t.string   "state"
    t.boolean  "paid"
  end

  add_index "bookings", ["calendar_id"], name: "index_bookings_on_calendar_id"
  add_index "bookings", ["profile_id"], name: "index_bookings_on_profile_id"
  add_index "bookings", ["profile_service_id"], name: "index_bookings_on_profile_service_id"
  add_index "bookings", ["service_id"], name: "index_bookings_on_service_id"

  create_table "calendars", force: :cascade do |t|
    t.string  "name"
    t.integer "profile_id"
    t.integer "user_id"
    t.integer "booking_id"
    t.boolean "taken",      default: false
  end

  add_index "calendars", ["booking_id"], name: "index_calendars_on_booking_id"
  add_index "calendars", ["profile_id"], name: "index_calendars_on_profile_id"
  add_index "calendars", ["user_id"], name: "index_calendars_on_user_id"

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "counties", ["region_id"], name: "index_counties_on_region_id"

  create_table "keeper_profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "booking_id"
    t.integer  "profile_id"
    t.string   "state"
    t.string   "token"
    t.integer  "amount"
    t.string   "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payments", ["booking_id"], name: "index_payments_on_booking_id"
  add_index "payments", ["profile_id"], name: "index_payments_on_profile_id"

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "breed"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "owneable_id"
    t.string   "owneable_type"
    t.integer  "user_id"
    t.string   "pet_image_file_name"
    t.string   "pet_image_content_type"
    t.integer  "pet_image_file_size"
    t.datetime "pet_image_updated_at"
    t.integer  "size"
  end

  add_index "pets", ["owneable_type", "owneable_id"], name: "index_pets_on_owneable_type_and_owneable_id"
  add_index "pets", ["user_id"], name: "index_pets_on_user_id"

  create_table "profile_services", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "service_id"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profile_services", ["profile_id"], name: "index_profile_services_on_profile_id"
  add_index "profile_services", ["service_id"], name: "index_profile_services_on_service_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "gender"
    t.date     "birthday"
    t.string   "cellphone"
    t.string   "address"
    t.string   "type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "phone"
    t.string   "rut"
    t.string   "country_code"
    t.integer  "county_id"
    t.string   "slogan"
    t.text     "bio"
    t.string   "date_birth"
    t.string   "state"
    t.string   "last_name"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "prospector_profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id"

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "code"
    t.string   "country_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "price"
    t.integer  "profile_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "services", ["profile_id"], name: "index_services_on_profile_id"

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "fb_access_token"
    t.integer  "role_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
