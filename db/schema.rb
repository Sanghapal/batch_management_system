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

ActiveRecord::Schema.define(:version => 20130322141145) do

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
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "country_id"
  end

  create_table "student_batches", :force => true do |t|
    t.integer  "Student_id"
    t.integer  "Batch_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "student_batches", ["Batch_id"], :name => "index_student_batches_on_Batch_id"
  add_index "student_batches", ["Student_id"], :name => "index_student_batches_on_Student_id"

  create_table "student_grades", :force => true do |t|
    t.integer  "Student_id"
    t.integer  "Grade_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "student_grades", ["Grade_id"], :name => "index_student_grades_on_Grade_id"
  add_index "student_grades", ["Student_id"], :name => "index_student_grades_on_Student_id"

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "mobile"
    t.integer  "alternate_mobile"
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
  end

  add_index "students", ["city_id"], :name => "index_students_on_city_id"
  add_index "students", ["state_id"], :name => "index_students_on_state_id"

end
