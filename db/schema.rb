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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130816054625) do

  create_table "hiring_partners", :force => true do |t|
    t.integer  "user_id"
    t.string   "linkedin"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "company_name"
    t.string   "website"
  end

  add_index "hiring_partners", ["user_id"], :name => "index_hiring_partners_on_user_id"

  create_table "mentors", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "phone"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.string   "linkedin"
    t.string   "github"
    t.string   "twitter"
    t.string   "blog"
    t.string   "website"
    t.string   "developer_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "address"
    t.string   "job_title"
    t.text     "skills"
  end

  add_index "mentors", ["user_id"], :name => "index_mentors_on_user_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "staff_members", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone"
    t.string   "linkedin"
    t.string   "github"
    t.string   "twitter"
    t.string   "blog"
    t.string   "website"
    t.string   "developer_type"
    t.boolean  "gmaps"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "job_title"
    t.text     "skills"
  end

  add_index "staff_members", ["user_id"], :name => "index_staff_members_on_user_id"

  create_table "students", :force => true do |t|
    t.string   "cohort"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.integer  "phone"
    t.integer  "user_id"
    t.string   "linkedin"
    t.string   "github"
    t.string   "twitter"
    t.string   "blog"
    t.string   "website"
    t.string   "mentor"
    t.string   "job_status"
    t.string   "entrepreneur"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.boolean  "gmaps"
    t.string   "developer_type"
    t.string   "name"
    t.string   "job_title"
    t.text     "skills"
  end

  add_index "students", ["user_id"], :name => "index_students_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gravatar"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
