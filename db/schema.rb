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

ActiveRecord::Schema.define(version: 20161202062008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "possible_training_divisions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "training_division_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "training_codes", force: :cascade do |t|
    t.integer  "code"
    t.string   "training_name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "trainings_training_codes_id"
  end

  create_table "training_divisions", force: :cascade do |t|
    t.string   "training_type"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "training_division_id"
    t.string   "location"
    t.string   "trainer"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.date     "training_date"
    t.text     "comments"
    t.float    "training_time"
    t.integer  "training_code_id"
    t.string   "t_time"
  end

  create_table "trainings_training_codes", force: :cascade do |t|
    t.integer  "training_id"
    t.integer  "training_code_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",                default: false
    t.string   "activation_digest"
    t.boolean  "activated",            default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "last_name"
    t.string   "authentication_token"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "possible_training_divisions", "training_divisions"
  add_foreign_key "possible_training_divisions", "users"
  add_foreign_key "trainings", "users"
  add_foreign_key "trainings_training_codes", "training_codes"
  add_foreign_key "trainings_training_codes", "trainings"
end
