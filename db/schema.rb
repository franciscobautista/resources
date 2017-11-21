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

ActiveRecord::Schema.define(version: 20171121041609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_collections_on_resource_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "resource_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_comments_on_resource_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "galleries", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_likes_on_resource_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "users_conversation_id"
    t.text "message"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_conversation_id"], name: "index_messages_on_users_conversation_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "facebook"
    t.string "twitter"
    t.string "google"
    t.string "pinterest"
    t.string "instagram"
    t.string "linkedin"
    t.string "web"
    t.string "company"
    t.string "city"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_people_on_country_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "file"
    t.string "name"
    t.string "description"
    t.bigint "user_id"
    t.string "cover"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "resources_galleries", force: :cascade do |t|
    t.bigint "resource_id"
    t.bigint "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gallery_id"], name: "index_resources_galleries_on_gallery_id"
    t.index ["resource_id"], name: "index_resources_galleries_on_resource_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "resource_id"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_tags_on_resource_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "person_id"
    t.string "password"
    t.string "email"
    t.datetime "last_access"
    t.integer "facebook_id"
    t.integer "twitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_users_on_person_id"
  end

  create_table "users_conversations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_users_conversations_on_conversation_id"
    t.index ["user_id"], name: "index_users_conversations_on_user_id"
  end

  create_table "views", force: :cascade do |t|
    t.bigint "resource_id"
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_views_on_resource_id"
  end

  add_foreign_key "collections", "resources"
  add_foreign_key "collections", "users"
  add_foreign_key "comments", "resources"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "resources"
  add_foreign_key "likes", "users"
  add_foreign_key "messages", "users_conversations"
  add_foreign_key "people", "countries"
  add_foreign_key "resources", "users"
  add_foreign_key "resources_galleries", "galleries"
  add_foreign_key "resources_galleries", "resources"
  add_foreign_key "tags", "resources"
  add_foreign_key "users", "people"
  add_foreign_key "users_conversations", "conversations"
  add_foreign_key "users_conversations", "users"
  add_foreign_key "views", "resources"
end
