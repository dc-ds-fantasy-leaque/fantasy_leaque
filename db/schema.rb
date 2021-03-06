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

ActiveRecord::Schema.define(version: 20180111125021) do

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "manager_name", null: false
    t.string "logo"
    t.string "stadium_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "photo"
    t.bigint "club_id"
    t.string "position", null: false
    t.datetime "date_of_birth", null: false
    t.string "national_team", null: false
    t.integer "goals", default: 0
    t.integer "assists", default: 0
    t.integer "yellow_cards", default: 0
    t.integer "red_cards", default: 0
    t.integer "penalty_missed", default: 0
    t.integer "penalty_saved", default: 0
    t.integer "clean_sheets", default: 0
    t.integer "total_minutes_played", default: 0
    t.string "injury", default: "0"
    t.integer "total_points", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_players_on_club_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.string "gender", null: false
    t.datetime "date_of_birth", null: false
    t.string "country", null: false
    t.bigint "club_id"
    t.string "team_name"
    t.decimal "budget", precision: 10, default: "100"
    t.integer "rank"
    t.integer "total_score", default: 0
    t.integer "free_transfer", default: 1
    t.integer "gameweek_joined"
    t.string "wildcard", default: "1"
    t.string "triple_captian", default: "1"
    t.string "bench_boost", default: "1"
    t.string "free_hit", default: "1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_users_on_club_id"
  end

  add_foreign_key "players", "clubs"
  add_foreign_key "users", "clubs"
end
