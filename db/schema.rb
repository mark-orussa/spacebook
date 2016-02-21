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

ActiveRecord::Schema.define(version: 20160220233820) do

  create_table "friends", force: true do |t|
    t.string   "user_id"
    t.string   "friend_id"
    t.boolean  "friends"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galaxies", force: true do |t|
    t.integer  "author",     limit: 255
    t.text     "content"
    t.string   "image"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "dob"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.text     "email",                  default: "", null: false
    t.text     "encrypted_password",     default: "", null: false
    t.text     "reset_password_token"
    t.text     "reset_password_sent_at"
    t.text     "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.text     "current_sign_in_at"
    t.text     "last_sign_in_at"
    t.text     "current_sign_in_ip"
    t.text     "last_sign_in_ip"
    t.text     "confirmation_token"
    t.text     "confirmed_at"
    t.text     "confirmation_sent_at"
    t.text     "unconfirmed_email"
    t.text     "created_at",                          null: false
    t.text     "updated_at",                          null: false
    t.text     "fName"
    t.text     "lName"
    t.integer  "age"
    t.datetime "dob"
    t.string   "avatar"
    t.string   "comments"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
