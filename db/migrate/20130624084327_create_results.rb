class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :marks
      t.references :exam
      t.references :student
      t.references :marking_patten

      t.timestamps
    end
    add_index :results, :exam_id
    add_index :results, :student_id
    add_index :results, :marking_patten_id
  end
end
