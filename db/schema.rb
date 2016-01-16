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

ActiveRecord::Schema.define(version: 20160104120613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attributes", force: true do |t|
    t.integer  "resume_id"
    t.string   "gender"
    t.string   "age"
    t.string   "height"
    t.string   "weight"
    t.string   "hair_color"
    t.string   "hair_lenght"
    t.string   "eye_color"
    t.string   "vocal_range"
    t.string   "ethnicity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "token_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "website"
    t.string   "primary_contact_email"
    t.string   "primary_contact_phone"
    t.integer  "year_founded"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "state"
    t.string   "country"
  end

  create_table "contact_infos", force: true do |t|
    t.integer  "resume_id"
    t.string   "nick_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "street_address1"
    t.string   "street_address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "country"
    t.string   "email"
    t.string   "website"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone1"
    t.string   "phone2"
    t.integer  "position"
  end

  create_table "custom_tables", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customs", force: true do |t|
    t.integer  "resume_id"
    t.string   "custom1"
    t.string   "custom2"
    t.string   "custom3"
    t.string   "custom4"
    t.string   "custom5"
    t.string   "custom6"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ccolumns",   default: [],    array: true
    t.boolean  "is_bold",    default: false
  end

  create_table "directors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "educations", force: true do |t|
    t.integer  "resume_id"
    t.string   "school"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "degree"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position"
    t.string   "ecolumns",   default: [],    array: true
    t.boolean  "is_bold",    default: false
  end

  create_table "invitations", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "state"
    t.string   "text"
    t.string   "type"
    t.integer  "to_id"
    t.integer  "by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "to_type"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.string   "express_token"
    t.string   "express_payer_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "ip_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "others", force: true do |t|
    t.text     "content"
    t.integer  "resume_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "user_id"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "imageable_id"
    t.string   "imageable_type"
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

  create_table "representations", force: true do |t|
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.text     "rcolumns",   default: ""
  end

  create_table "resume_sections", force: true do |t|
    t.integer  "position"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section_id"
    t.string   "section_name"
  end

  create_table "resumes", force: true do |t|
    t.integer  "type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_type"
    t.string   "skills"
    t.text     "other"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "performer_type"
    t.string   "union_guild"
    t.string   "resume_name"
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
    t.integer  "user_id"
  end

  create_table "rtable_items", force: true do |t|
    t.integer "rtable_id"
    t.integer "position"
    t.string  "values",    array: true
  end

  create_table "rtables", force: true do |t|
    t.string   "title"
    t.string   "columns",    default: [], array: true
    t.integer  "positions",  default: [], array: true
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resume_id"
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
    t.integer  "opening_date_mask", default: 7
  end

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "skills", force: true do |t|
    t.integer  "resume_id"
    t.string   "category"
    t.string   "skills"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "position"
  end

  create_table "theatres", force: true do |t|
    t.integer  "resume_id"
    t.string   "role"
    t.string   "directed_by"
    t.date     "performance_date"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "director_id"
    t.string   "production"
    t.string   "venue"
    t.string   "company"
    t.integer  "position"
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
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "gender"
    t.string   "member_type"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
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
    t.string   "website"
    t.string   "primary_contact_name"
    t.string   "primary_contact_email"
    t.string   "primary_contact_phone"
    t.integer  "year_founded"
  end

  create_table "videos", force: true do |t|
    t.string   "video_url"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

end
