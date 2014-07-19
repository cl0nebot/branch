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

ActiveRecord::Schema.define(version: 20140127005321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amendments", force: true do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.string   "subject"
    t.text     "body"
    t.float    "confidence"
    t.float    "heat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "body"
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

  create_table "matcher_answers", force: true do |t|
    t.integer  "matcher_profile_id"
    t.integer  "matcher_question_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "axis"
  end

  add_index "matcher_answers", ["axis"], name: "index_on_answer_axis", using: :btree

  create_table "matcher_profiles", force: true do |t|
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
    t.integer  "xcoord",              default: 0, null: false
    t.integer  "ycoord",              default: 0, null: false
    t.integer  "zcoord"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "matcher_profiles", ["xcoord", "ycoord", "zcoord"], name: "index_on_profile_coordinates", using: :btree

  create_table "matcher_questions", force: true do |t|
    t.integer  "axis"
    t.integer  "parity"
    t.string   "prompt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matcher_questions", ["axis", "parity"], name: "index_on_question_type_and_parity", using: :btree

  create_table "proposals", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "user_id"
    t.float    "confidence"
    t.float    "heat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
