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

ActiveRecord::Schema.define(version: 2019_10_31_134224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.datetime "due_date"
    t.integer "container_id"
    t.string "container_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_assignments_on_users_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "file_file_name"
    t.string "file_content_type"
    t.bigint "file_file_size"
    t.datetime "file_updated_at"
    t.bigint "user_id"
    t.string "attachments_type"
    t.bigint "attachments_id"
    t.string "container_type"
    t.bigint "container_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachments_type", "attachments_id"], name: "index_attachments_on_attachments_type_and_attachments_id"
    t.index ["container_type", "container_id"], name: "index_attachments_on_container_type_and_container_id"
    t.index ["user_id"], name: "index_attachments_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "portal_id"
    t.index ["portal_id"], name: "index_categories_on_portal_id"
  end

  create_table "course_modules", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "description", default: "", null: false
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_modules_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "description", default: "", null: false
    t.bigint "category_id"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "portal_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["category_id"], name: "index_courses_on_category_id"
    t.index ["portal_id"], name: "index_courses_on_portal_id"
  end

  create_table "courses_teachers", id: false, force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "course_id", null: false
    t.index ["course_id"], name: "index_courses_teachers_on_course_id"
    t.index ["teacher_id"], name: "index_courses_teachers_on_teacher_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "course_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "grades", force: :cascade do |t|
    t.float "value", null: false
    t.datetime "date"
    t.bigint "user_id"
    t.integer "container_id"
    t.string "container_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_grades_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "groupname", default: "", null: false
    t.boolean "is_public"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "limit"
    t.integer "teacher_id"
    t.index ["course_id"], name: "index_groups_on_course_id"
    t.index ["teacher_id"], name: "index_groups_on_teacher_id"
  end

  create_table "groups_students", id: false, force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "group_id", null: false
    t.index ["group_id"], name: "index_groups_students_on_group_id"
    t.index ["student_id"], name: "index_groups_students_on_student_id"
  end

  create_table "metadata", force: :cascade do |t|
    t.integer "container_id"
    t.string "container_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "portal_id"
    t.index ["portal_id"], name: "index_metadata_on_portal_id"
  end

  create_table "portals", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "nickname", default: ""
    t.string "address", default: ""
    t.string "position", default: ""
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type"
    t.bigint "portal_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["portal_id"], name: "index_users_on_portal_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "users", column: "users_id"
  add_foreign_key "categories", "portals"
  add_foreign_key "courses", "portals"
  add_foreign_key "metadata", "portals"
  add_foreign_key "users", "portals"
end
