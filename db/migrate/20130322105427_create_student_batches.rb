class CreateStudentBatches < ActiveRecord::Migration
  def change
    create_table :student_batches do |t|
      t.references :Student
      t.references :Batch

      t.timestamps
    end
    add_index :student_batches, :Student_id
    add_index :student_batches, :Batch_id
  end
end
