class CreateStudentGrades < ActiveRecord::Migration
  def change
    create_table :student_grades do |t|
      t.references :Student
      t.references :Grade

      t.timestamps
    end
    add_index :student_grades, :Student_id
    add_index :student_grades, :Grade_id
  end
end
