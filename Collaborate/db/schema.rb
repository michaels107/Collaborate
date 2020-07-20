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

ActiveRecord::Schema.define(version: 2020_07_19_230744) do

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "apart_ofs", force: :cascade do |t|
    t.integer "name_dot_number_id"
    t.integer "group_name_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_name_id"], name: "index_apart_ofs_on_group_name_id"
    t.index ["name_dot_number_id"], name: "index_apart_ofs_on_name_dot_number_id"
  end

  create_table "assisted_bies", force: :cascade do |t|
    t.integer "email_professor_id"
    t.integer "email_ta_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_professor_id"], name: "index_assisted_bies_on_email_professor_id"
    t.index ["email_ta_id"], name: "index_assisted_bies_on_email_ta_id"
  end

  create_table "gives", force: :cascade do |t|
    t.integer "id_id"
    t.integer "name_dot_number_id"
    t.integer "email_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_id"], name: "index_gives_on_email_id"
    t.index ["id_id"], name: "index_gives_on_id_id"
    t.index ["name_dot_number_id"], name: "index_gives_on_name_dot_number_id"
  end

  create_table "peer_evaluations", force: :cascade do |t|
    t.string "project_role"
    t.string "content"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_peer_evaluations_on_project_id"
  end

  create_table "professors", force: :cascade do |t|
    t.integer "account_id"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_professors_on_account_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
