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

ActiveRecord::Schema.define(version: 20131012212251) do

  create_table "codes", force: true do |t|
    t.text     "source"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "guild_id"
    t.integer  "quest_id"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code_id"
  end

  create_table "guilds", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quests", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
  end

  create_table "user_guilds", force: true do |t|
    t.integer  "user_id"
    t.integer  "guild_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_guilds", ["guild_id"], name: "index_user_guilds_on_guild_id"
  add_index "user_guilds", ["user_id", "guild_id"], name: "index_user_guilds_on_user_id_and_guild_id"
  add_index "user_guilds", ["user_id"], name: "index_user_guilds_on_user_id"

  create_table "user_like_codes", force: true do |t|
    t.integer  "user_id"
    t.integer  "code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_like_codes", ["code_id"], name: "index_user_like_codes_on_code_id"
  add_index "user_like_codes", ["user_id", "code_id"], name: "index_user_like_codes_on_user_id_and_code_id"
  add_index "user_like_codes", ["user_id"], name: "index_user_like_codes_on_user_id"

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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username"

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "quest_id"
    t.integer  "guild_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["user_id", "quest_id"], name: "index_votes_on_user_id_and_quest_id"

end
