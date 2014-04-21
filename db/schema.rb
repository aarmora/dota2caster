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

ActiveRecord::Schema.define(version: 20140421130010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caster_comments", force: true do |t|
    t.integer  "commenter_id"
    t.integer  "recipient_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "casters", force: true do |t|
    t.string   "name"
    t.integer  "steam_id",           limit: 8
    t.string   "twitch"
    t.string   "youtube"
    t.string   "twitter"
    t.string   "email"
    t.boolean  "email_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "endorsements_count",           default: 0,     null: false
    t.integer  "comments_count",               default: 0,     null: false
    t.boolean  "caster",                       default: false
    t.text     "bio"
  end

  create_table "player_votes", force: true do |t|
    t.integer "voter_id"
    t.integer "recipient_id"
  end

end
