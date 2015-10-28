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

ActiveRecord::Schema.define(version: 20151025190008) do

  create_table "feedings", force: :cascade do |t|
    t.datetime "date"
    t.integer  "amount"
    t.integer  "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "breed"
    t.integer  "weight"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "api_key"
    t.integer  "master_user"
  end

  create_table "requests", force: :cascade do |t|
    t.string   "body",       default: "do nothing"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "schedule"
    t.integer  "user_id"
    t.integer  "pet_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.integer  "pet_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.string   "secret"
    t.string   "profile_image"
  end

end
