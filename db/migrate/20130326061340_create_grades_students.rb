class CreateGradesStudents < ActiveRecord::Migration
  def change
    create_table :grades_students do |t|
      t.references :grade
      t.references :student

      t.timestamps
    end
    add_index :grades_students, :grade_id
    add_index :grades_students, :student_id
  end
end
