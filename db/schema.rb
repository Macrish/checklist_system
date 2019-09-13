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

ActiveRecord::Schema.define(version: 2019_09_13_161226) do

  create_table "answers", force: :cascade do |t|
    t.string "choice"
    t.text "comment"
    t.integer "checklist_id", null: false
    t.integer "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["checklist_id"], name: "index_answers_on_checklist_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "project_id"
    t.integer "user_id", null: false
    t.integer "form_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["form_id"], name: "index_checklists_on_form_id"
    t.index ["user_id"], name: "index_checklists_on_user_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "status"
    t.datetime "published_at"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question_text"
    t.text "question_description"
    t.integer "form_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["form_id"], name: "index_questions_on_form_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "checklists"
  add_foreign_key "answers", "questions"
  add_foreign_key "checklists", "forms"
  add_foreign_key "checklists", "users"
  add_foreign_key "forms", "users"
  add_foreign_key "questions", "forms"
end
