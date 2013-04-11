class AddColumnToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :batch_duration, :string
    add_column :grades, :session_duration, :string
  end
end
