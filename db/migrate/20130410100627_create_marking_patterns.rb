class CreateMarkingPatterns < ActiveRecord::Migration
  def change
    create_table :marking_patterns do |t|
      t.integer :marks
      t.references :grade
      t.references :subject

      t.timestamps
    end
    add_index :marking_patterns, :grade_id
    add_index :marking_patterns, :subject_id
  end
end
