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

ActiveRecord::Schema.define(version: 20160511200732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.integer  "player_id"
    t.float    "field",      default: 0.0
    t.float    "throw",      default: 0.0
    t.float    "hit",        default: 0.0
    t.float    "speed",      default: 0.0
    t.string   "time"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "atbat",      default: 0
    t.integer  "single",     default: 0
    t.integer  "double",     default: 0
    t.integer  "triple",     default: 0
    t.integer  "homerun",    default: 0
    t.integer  "flyout",     default: 0
    t.integer  "lineout",    default: 0
    t.integer  "groundout",  default: 0
    t.integer  "fc",         default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "player_id"
    t.integer  "sacfly",     default: 0
    t.string   "gamecode"
    t.integer  "error",      default: 0
    t.boolean  "isofficial", default: true
    t.integer  "run",        default: 0
    t.integer  "rbi",        default: 0
    t.integer  "stolenbase", default: 0
    t.integer  "strikeout",  default: 0
  end

  add_index "games", ["player_id"], name: "index_games_on_player_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "secretkey"
  end

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "games", "players"
end
