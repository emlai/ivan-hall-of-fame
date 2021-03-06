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

ActiveRecord::Schema.define(version: 20170417132722) do

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "attnam_username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "auth_token"
    t.index ["auth_token"], name: "index_players_on_auth_token", unique: true
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "points"
    t.string   "character"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "entry"
    t.integer  "version_id"
    t.index ["player_id"], name: "index_scores_on_player_id"
    t.index ["version_id"], name: "index_scores_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string   "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
