class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.date :exam_date
      t.references :batch

      t.timestamps
    end
    add_index :exams, :batch_id
  end
end
