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

ActiveRecord::Schema.define(version: 20160507071200) do

  create_table "bus_positions", force: :cascade do |t|
    t.integer  "bus_id",     limit: 4
    t.time     "time"
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.float    "speed",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "bus_positions", ["bus_id"], name: "index_bus_positions_on_bus_id", using: :btree
  add_index "bus_positions", ["latitude"], name: "index_bus_positions_on_latitude", using: :btree
  add_index "bus_positions", ["longitude"], name: "index_bus_positions_on_longitude", using: :btree

end
