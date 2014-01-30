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

ActiveRecord::Schema.define(version: 20140123171344) do

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.integer  "opinion_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "problem_id"
  end

  add_index "comments", ["opinion_id"], name: "id_idx", using: :btree
  add_index "comments", ["problem_id"], name: "id_idx1", using: :btree
  add_index "comments", ["user_id"], name: "uid_idx", using: :btree

  create_table "constituencies", force: true do |t|
    t.string   "name"
    t.integer  "cid"
    t.string   "current_MLA"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opinions", force: true do |t|
    t.text     "opinion"
    t.integer  "pid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opinions", ["pid"], name: "pid_idx", using: :btree

  create_table "problems", force: true do |t|
    t.integer  "cid"
    t.string   "category"
    t.boolean  "resolved"
    t.integer  "user_id_posted"
    t.integer  "user_id_resolved"
    t.integer  "rating"
    t.text     "resolution"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description",      limit: 2147483647
  end

  add_index "problems", ["cid"], name: "cid_idx", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.text     "education"
    t.text     "additional_details", limit: 2147483647
    t.text     "about",              limit: 2147483647
    t.text     "manifesto",          limit: 2147483647
    t.integer  "pid"
    t.string   "user_id"
    t.integer  "constituency_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",              limit: 45
    t.integer  "is_mla",                                default: 0
  end

  create_table "signatures", force: true do |t|
    t.integer  "user_id"
    t.integer  "problem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "signatures", ["problem_id"], name: "prob_id_idx", using: :btree
  add_index "signatures", ["user_id"], name: "uid_idx", using: :btree

  create_table "stats", force: true do |t|
    t.text     "data"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "mob_no"
    t.string   "constituency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
