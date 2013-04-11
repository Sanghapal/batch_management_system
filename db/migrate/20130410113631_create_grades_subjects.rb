class CreateGradesSubjects < ActiveRecord::Migration
  def change
    create_table :grades_subjects do |t|
      t.integer :marks
      t.references :grade
      t.references :subject

      t.timestamps
    end
    add_index :grades_subjects, :grade_id
    add_index :grades_subjects, :subject_id
  end
end
