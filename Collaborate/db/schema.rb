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

ActiveRecord::Schema.define(version: 2020_07_25_024310) do

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
    t.integer "student_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_apart_ofs_on_group_id"
    t.index ["student_id"], name: "index_apart_ofs_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "section_num"
    t.string "course_name"
    t.string "course_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrolled_ins", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrolled_ins_on_course_id"
    t.index ["student_id"], name: "index_enrolled_ins_on_student_id"
  end

  create_table "gives", force: :cascade do |t|
    t.integer "peer_evaluation_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["peer_evaluation_id"], name: "index_gives_on_peer_evaluation_id"
    t.index ["student_id"], name: "index_gives_on_student_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "group_name"
    t.integer "num_of_teammates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peer_evaluations", force: :cascade do |t|
    t.string "project_role"
    t.string "content"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group_id"
    t.integer "student_id"
    t.index ["group_id"], name: "index_peer_evaluations_on_group_id"
    t.index ["project_id"], name: "index_peer_evaluations_on_project_id"
    t.index ["student_id"], name: "index_peer_evaluations_on_student_id"
  end

  create_table "professors", force: :cascade do |t|
    t.integer "account_id"
    t.string "f_name"
    t.string "l_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_professors_on_account_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.index ["course_id"], name: "index_projects_on_course_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "dot_name"
    t.string "f_name"
    t.string "l_name"
    t.string "rating"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_students_on_account_id"
  end

  create_table "taught_bies", force: :cascade do |t|
    t.integer "professor_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_taught_bies_on_course_id"
    t.index ["professor_id"], name: "index_taught_bies_on_professor_id"
  end

end
