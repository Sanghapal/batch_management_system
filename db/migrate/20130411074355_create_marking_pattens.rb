class CreateMarkingPattens < ActiveRecord::Migration
  def change
    create_table :marking_pattens do |t|
      t.integer :marks
      t.references :grade
      t.references :subject

      t.timestamps
    end
    add_index :marking_pattens, :grade_id
    add_index :marking_pattens, :subject_id
  end
end
