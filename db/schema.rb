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

ActiveRecord::Schema.define(:version => 20130612094153) do

  create_table "admissions", :force => true do |t|
    t.integer  "grade_id"
    t.integer  "student_id"
    t.integer  "student_fee"
    t.integer  "sponsor_fee"
    t.integer  "sponsor_id"
    t.string   "qualifies_with"
    t.date     "admission_date"
    t.boolean  "sponsor_flag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "admissions", ["grade_id"], :name => "index_admissions_on_grade_id"
  add_index "admissions", ["sponsor_id"], :name => "index_admissions_on_sponsor_id"
  add_index "admissions", ["student_id"], :name => "index_admissions_on_student_id"

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

  create_table "enquiries", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.integer  "zip_code"
    t.text     "enquierd_for"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "mobile"
  end

  add_index "enquiries", ["city_id"], :name => "index_enquiries_on_city_id"
  add_index "enquiries", ["state_id"], :name => "index_enquiries_on_state_id"

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

  create_table "lectures", :force => true do |t|
    t.integer  "batch_id"
    t.boolean  "assign_homework"
    t.date     "session_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "lectures", ["batch_id"], :name => "index_lectures_on_batch_id"

  create_table "marking_pattens", :force => true do |t|
    t.integer  "marks"
    t.integer  "grade_id"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "marking_pattens", ["grade_id"], :name => "index_marking_pattens_on_grade_id"
  add_index "marking_pattens", ["subject_id"], :name => "index_marking_pattens_on_subject_id"

  create_table "marking_pattens_trainers", :force => true do |t|
    t.integer  "marking_patten_id"
    t.integer  "trainer_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "marking_pattens_trainers", ["marking_patten_id"], :name => "index_marking_pattens_trainers_on_marking_patten_id"
  add_index "marking_pattens_trainers", ["trainer_id"], :name => "index_marking_pattens_trainers_on_trainer_id"

  create_table "presenties", :force => true do |t|
    t.integer  "student_id"
    t.integer  "lecture_id"
    t.boolean  "attendent"
    t.boolean  "done_homework"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "presenties", ["lecture_id"], :name => "index_presenties_on_lecture_id"
  add_index "presenties", ["student_id"], :name => "index_presenties_on_student_id"

  create_table "sponsors", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "pan_number"
    t.string   "address_line1"
    t.string   "address_line2"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "pin_code"
    t.string   "mobile_number"
    t.string   "alternate_mobile"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "sponsors", ["city_id"], :name => "index_sponsors_on_city_id"
  add_index "sponsors", ["country_id"], :name => "index_sponsors_on_country_id"
  add_index "sponsors", ["state_id"], :name => "index_sponsors_on_state_id"

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
    t.date     "enrollment_date"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "country_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "ban"
    t.string   "mobile"
    t.string   "alternate_mobile"
    t.date     "date_of_birth"
    t.boolean  "address_proof"
    t.boolean  "blindness_certificate"
    t.string   "blindness_file_name"
    t.string   "blindness_content_type"
    t.integer  "blindness_file_size"
    t.datetime "blindness_updated_at"
    t.string   "address_file_name"
    t.string   "address_content_type"
    t.integer  "address_file_size"
    t.datetime "address_updated_at"
  end

  add_index "students", ["city_id"], :name => "index_students_on_city_id"
  add_index "students", ["state_id"], :name => "index_students_on_state_id"

  create_table "subjects", :force => true do |t|
    t.string   "subject"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trainers", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "mobile_number"
    t.string   "email"
    t.boolean  "qualification"
    t.string   "address_line1"
    t.string   "address_line2"
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "zip_code"
    t.boolean  "address_proof"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "delete_flag"
    t.date     "date_of_birth"
    t.string   "address_proof_file_name"
    t.string   "address_proof_content_type"
    t.integer  "address_proof_file_size"
    t.datetime "address_proof_updated_at"
    t.string   "qualification_file_name"
    t.string   "qualification_content_type"
    t.integer  "qualification_file_size"
    t.datetime "qualification_updated_at"
  end

  add_index "trainers", ["city_id"], :name => "index_trainers_on_city_id"
  add_index "trainers", ["country_id"], :name => "index_trainers_on_country_id"
  add_index "trainers", ["state_id"], :name => "index_trainers_on_state_id"

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
