class CreateBatchesStudents < ActiveRecord::Migration
  def change
    create_table :batches_students do |t|
      t.references :batch
      t.references :student

      t.timestamps
    end
    add_index :batches_students, :batch_id
    add_index :batches_students, :student_id
  end
end
