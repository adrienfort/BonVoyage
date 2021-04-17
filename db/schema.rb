# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_17_180716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "albums", force: :cascade do |t|
    t.string "meaning"
    t.bigint "artist_id", null: false
    t.integer "nb_plays", default: 0
    t.float "duration", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "nb_plays", default: 0
    t.float "duration", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_artists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true
  end

  create_table "explorers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.index ["email"], name: "index_explorers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_explorers_on_reset_password_token", unique: true
  end

  create_table "fan_albums", force: :cascade do |t|
    t.bigint "album_id", null: false
    t.bigint "explorer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["album_id"], name: "index_fan_albums_on_album_id"
    t.index ["explorer_id"], name: "index_fan_albums_on_explorer_id"
  end

  create_table "fan_artists", force: :cascade do |t|
    t.bigint "explorer_id", null: false
    t.bigint "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_fan_artists_on_artist_id"
    t.index ["explorer_id"], name: "index_fan_artists_on_explorer_id"
  end

  create_table "fan_musics", force: :cascade do |t|
    t.bigint "music_id", null: false
    t.bigint "explorer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["explorer_id"], name: "index_fan_musics_on_explorer_id"
    t.index ["music_id"], name: "index_fan_musics_on_music_id"
  end

  create_table "musics", force: :cascade do |t|
    t.string "name"
    t.integer "nb_plays", default: 0
    t.float "duration", default: 0.0
    t.integer "nb_love", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "album_id", null: false
    t.index ["album_id"], name: "index_musics_on_album_id"
  end

  create_table "playlist_musics", force: :cascade do |t|
    t.bigint "playlist_id", null: false
    t.bigint "music_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["music_id"], name: "index_playlist_musics_on_music_id"
    t.index ["playlist_id"], name: "index_playlist_musics_on_playlist_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name"
    t.bigint "explorer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["explorer_id"], name: "index_playlists_on_explorer_id"
  end

  create_table "plays", force: :cascade do |t|
    t.bigint "music_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["music_id"], name: "index_plays_on_music_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "albums", "artists"
  add_foreign_key "fan_albums", "albums"
  add_foreign_key "fan_albums", "explorers"
  add_foreign_key "fan_artists", "artists"
  add_foreign_key "fan_artists", "explorers"
  add_foreign_key "fan_musics", "explorers"
  add_foreign_key "fan_musics", "musics"
  add_foreign_key "musics", "albums"
  add_foreign_key "playlist_musics", "musics"
  add_foreign_key "playlist_musics", "playlists"
  add_foreign_key "playlists", "explorers"
  add_foreign_key "plays", "musics"
end
