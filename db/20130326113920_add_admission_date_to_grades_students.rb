class AddAdmissionDateToGradesStudents < ActiveRecord::Migration
  def change
    add_column :grades_students, :admission_date, :date
  end
end
