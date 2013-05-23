class CreateReportsStudents < ActiveRecord::Migration
  def change
    create_table :reports_students do |t|
      t.references :student
      t.references :report

      t.timestamps
    end
    add_index :reports_students, :student_id
    add_index :reports_students, :report_id
  end
end
