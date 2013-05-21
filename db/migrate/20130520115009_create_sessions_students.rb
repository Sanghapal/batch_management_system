class CreateSessionsStudents < ActiveRecord::Migration
  def change
    create_table :sessions_students do |t|
      t.references :student
      t.references :session

      t.timestamps
    end
    add_index :sessions_students, :student_id
    add_index :sessions_students, :session_id
  end
end
