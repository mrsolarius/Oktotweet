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

ActiveRecord::Schema.define(version: 2021_04_29_151947) do

  create_table "follows", force: :cascade do |t|
    t.integer "follower_user_id", null: false
    t.integer "followed_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_user_id", "follower_user_id"], name: "index_follows_on_followed_user_id_and_follower_user_id", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags_tweets", id: false, force: :cascade do |t|
    t.integer "tweet_id"
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_tags_tweets_on_tag_id"
    t.index ["tweet_id", "tag_id"], name: "index_tags_tweets_on_tweet_id_and_tag_id", unique: true
    t.index ["tweet_id"], name: "index_tags_tweets_on_tweet_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.string "tweet"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "name"
    t.text "bio"
    t.string "location"
    t.string "imageName"
    t.binary "imageB64", limit: 52428800
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "tweets", "users"
end
