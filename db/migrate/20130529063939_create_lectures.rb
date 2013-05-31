class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.references :batch
      t.boolean :assign_homework
      t.date :session_date

      t.timestamps
    end
    add_index :lectures, :batch_id
  end
end
