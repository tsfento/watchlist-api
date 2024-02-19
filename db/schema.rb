# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_19_150157) do
  create_table "user_watch_titles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "watch_title_id", null: false
    t.boolean "watched", default: false
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_watch_titles_on_user_id"
    t.index ["watch_title_id"], name: "index_user_watch_titles_on_watch_title_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "watch_list_followers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "watch_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_watch_list_followers_on_user_id"
    t.index ["watch_list_id"], name: "index_watch_list_followers_on_watch_list_id"
  end

  create_table "watch_lists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "private", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_watch_lists_on_user_id"
  end

  create_table "watch_lists_titles", id: false, force: :cascade do |t|
    t.integer "watch_list_id", null: false
    t.integer "watch_title_id", null: false
    t.index ["watch_list_id", "watch_title_id"], name: "index_watch_lists_titles_on_watch_list_id_and_watch_title_id"
    t.index ["watch_title_id", "watch_list_id"], name: "index_watch_lists_titles_on_watch_title_id_and_watch_list_id"
  end

  create_table "watch_titles", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "imdb_id"
    t.string "poster_path"
    t.string "title"
    t.datetime "release_date"
    t.text "overview"
    t.integer "runtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_watch_titles", "users"
  add_foreign_key "user_watch_titles", "watch_titles"
  add_foreign_key "watch_list_followers", "users"
  add_foreign_key "watch_list_followers", "watch_lists"
  add_foreign_key "watch_lists", "users"
end
