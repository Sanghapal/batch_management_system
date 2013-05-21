class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :batch
      t.boolean :assign_home
      t.date :session_date

      t.timestamps
    end
    add_index :sessions, :batch_id
  end
end
