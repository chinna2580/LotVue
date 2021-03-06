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

ActiveRecord::Schema.define(version: 20180810112819) do

  create_table "roles", force: :cascade do |t|
    t.text "role_name"
    t.boolean "is_hidden", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_meta", force: :cascade do |t|
    t.integer "user_id"
    t.text "meta_key"
    t.text "meta_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_meta_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "users_id"
    t.integer "roles_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roles_id"], name: "index_user_roles_on_roles_id"
    t.index ["users_id"], name: "index_user_roles_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
