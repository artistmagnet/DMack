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

ActiveRecord::Schema.define(version: 20141112104722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "primary_contact_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone"
    t.string   "addr_fb"
    t.string   "addr_tw"
    t.string   "addr_ins"
    t.string   "addr_lin"
  end

  create_table "invitations", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "state"
    t.string   "text"
    t.string   "type"
    t.integer  "to_id"
    t.string   "to_type"
    t.integer  "by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  create_table "productions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "director_id"
    t.string   "dirname"
    t.string   "diremail"
  end

  create_table "resumes", force: true do |t|
    t.integer  "type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resume_id"
    t.integer  "production_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "director_id"
    t.string   "dirname"
    t.string   "diremail"
  end

  create_table "rtables", force: true do |t|
    t.string   "title"
    t.string   "columns",    default: [], array: true
    t.integer  "positions",  default: [], array: true
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_slots", force: true do |t|
    t.integer  "position"
    t.integer  "resume_id"
    t.integer  "section_id"
    t.string   "section_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", force: true do |t|
    t.integer  "production_id"
    t.integer  "venue_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "state"
    t.string   "country"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone"
    t.string   "addr_fb"
    t.string   "addr_tw"
    t.string   "addr_ins"
    t.string   "addr_lin"
  end

end