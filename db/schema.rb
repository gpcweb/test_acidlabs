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

ActiveRecord::Schema.define(version: 20140902182239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: true do |t|
    t.string   "nombre"
    t.integer  "artista_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uri"
    t.integer  "anio"
    t.decimal  "avg_popularidad", precision: 15, scale: 2
  end

  add_index "albums", ["artista_id"], name: "index_albums_on_artista_id", using: :btree

  create_table "artista", force: true do |t|
    t.string   "nombre"
    t.decimal  "popularidad", precision: 15, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uri"
  end

  create_table "pista", force: true do |t|
    t.string   "nombre"
    t.decimal  "duracion",    precision: 15, scale: 2
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uri"
    t.integer  "numero"
    t.decimal  "popularidad", precision: 15, scale: 2
  end

  add_index "pista", ["album_id"], name: "index_pista_on_album_id", using: :btree

end
