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

ActiveRecord::Schema.define(version: 20171230172744) do

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
    t.index ["id"], name: "index_clubs_on_id"
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.string "photo"
    t.integer "club_id", null: false
    t.string "position", null: false
    t.datetime "date_of_birth", null: false
    t.string "national_team", null: false
    t.integer "appearences", default: 0
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.integer "draws", default: 0
    t.datetime "pl_debut"
    t.integer "goals", default: 0
    t.integer "assists", default: 0
    t.integer "yellow_cards", default: 0
    t.integer "red_cards", default: 0
    t.integer "penalty_conceded", default: 0
    t.integer "penalty_saved", default: 0
    t.integer "clean_sheets", default: 0
    t.integer "previous_club", default: 0
    t.string "previous_club_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_players_on_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.string "gender", null: false
    t.datetime "date_of_birth", null: false
    t.string "country", null: false
    t.integer "club_id"
    t.string "team_name"
    t.decimal "budget", precision: 10
    t.integer "rank"
    t.integer "total_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_users_on_club_id"
    t.index ["id"], name: "index_users_on_id"
  end

end
