class CreatePresenties < ActiveRecord::Migration
  def change
    create_table :presenties do |t|
      t.references :student
      t.references :lecture
      t.boolean :attendent
      t.boolean :done_homework

      t.timestamps
    end
    add_index :presenties, :student_id
    add_index :presenties, :lecture_id
  end
end
