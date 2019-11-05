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

ActiveRecord::Schema.define(version: 2019_11_04_233639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.string "src"
    t.bigint "tattoo_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tattoo_id_id"], name: "index_images_on_tattoo_id_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "review"
    t.bigint "customer_id_id"
    t.bigint "tattoo_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id_id"], name: "index_reviews_on_customer_id_id"
    t.index ["tattoo_id_id"], name: "index_reviews_on_tattoo_id_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "tattoos", force: :cascade do |t|
    t.bigint "customer_id_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id_id"], name: "index_tattoos_on_customer_id_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.boolean "artist", default: false, null: false
    t.string "username", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "shopname"
    t.string "suburb"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "images", "users", column: "tattoo_id_id"
  add_foreign_key "reviews", "users", column: "customer_id_id"
  add_foreign_key "reviews", "users", column: "tattoo_id_id"
  add_foreign_key "tattoos", "users", column: "customer_id_id"
  add_foreign_key "transactions", "users"
end
