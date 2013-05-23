class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :batch
      t.boolean :assign_homework
      t.date :session_date

      t.timestamps
    end
    add_index :reports, :batch_id
  end
end
