# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130411074355) do

  create_table "batches", :force => true do |t|
    t.string   "title"
    t.integer  "grade_id"
    t.date     "starte_date"
    t.date     "end_date"
    t.text     "deys_of_week"
    t.time     "from_time"
    t.time     "end_time"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "batches_students", :force => true do |t|
    t.integer  "batch_id"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "batches_students", ["batch_id"], :name => "index_batches_students_on_batch_id"
  add_index "batches_students", ["student_id"], :name => "index_batches_students_on_student_id"

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "grades", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.float    "student_fee"
    t.float    "sponsor_fee"
    t.string   "batch_duration"
    t.string   "session_duration"
  end

  create_table "grades_students", :force => true do |t|
    t.integer  "grade_id"
    t.integer  "student_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.date     "admission_date"
  end

  add_index "grades_students", ["grade_id"], :name => "index_grades_students_on_grade_id"
  add_index "grades_students", ["student_id"], :name => "index_grades_students_on_student_id"

  create_table "grades_subjects", :force => true do |t|
    t.integer  "marks"
    t.integer  "grade_id"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "grades_subjects", ["grade_id"], :name => "index_grades_subjects_on_grade_id"
  add_index "grades_subjects", ["subject_id"], :name => "index_grades_subjects_on_subject_id"

  create_table "marking_pattens", :force => true do |t|
    t.integer  "marks"
    t.integer  "grade_id"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "marking_pattens", ["grade_id"], :name => "index_marking_pattens_on_grade_id"
  add_index "marking_pattens", ["subject_id"], :name => "index_marking_pattens_on_subject_id"

  create_table "sponsors", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "pan_number"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "country_id"
  end

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "state_id"
    t.integer  "city_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.integer  "zip_code"
    t.string   "qualifies_with"
    t.date     "enrollment_date"
    t.boolean  "sponsor"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "country_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "ban"
    t.string   "mobile"
    t.string   "alternate_mobile"
  end

  add_index "students", ["city_id"], :name => "index_students_on_city_id"
  add_index "students", ["state_id"], :name => "index_students_on_state_id"

  create_table "subjects", :force => true do |t|
    t.string   "subject"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
