class AddAddmitionDateToStudentGrade < ActiveRecord::Migration
  def change
    add_column :student_grades, :addmition_date, :date
  end
end
