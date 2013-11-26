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

ActiveRecord::Schema.define(version: 20131125045952) do

  create_table "amendments", force: true do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.string   "subject"
    t.text     "body"
    t.integer  "upvotes"
    t.integer  "downvotes"
    t.float    "confidence"
    t.float    "heat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  create_table "answers", force: true do |t|
    t.integer  "profile_id"
    t.integer  "question_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "axis"
  end

  add_index "answers", ["axis"], name: "index_on_answer_axis"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.text     "body"
    t.integer  "upvotes"
    t.integer  "downvotes"
    t.float    "confidence"
    t.float    "heat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  create_table "discussion_topics", force: true do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.text     "text"
    t.integer  "upvotes"
    t.integer  "downvotes"
    t.decimal  "heat"
    t.decimal  "confidence"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  create_table "feed_items", force: true do |t|
    t.integer  "user_id"
    t.string   "feedable_type"
    t.integer  "feedable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.boolean  "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "middle_name"
    t.text     "summary"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "xcoord",      default: 0, null: false
    t.integer  "ycoord",      default: 0, null: false
    t.integer  "zcoord"
  end

  add_index "profiles", ["xcoord", "ycoord", "zcoord"], name: "index_on_profile_coordinates"

  create_table "proposals", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "upvotes"
    t.integer  "downvotes"
    t.float    "confidence"
    t.float    "heat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  create_table "questions", force: true do |t|
    t.integer  "type"
    t.integer  "parity"
    t.string   "prompt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["type", "parity"], name: "index_on_question_type_and_parity"

  create_table "users", force: true do |t|
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
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
