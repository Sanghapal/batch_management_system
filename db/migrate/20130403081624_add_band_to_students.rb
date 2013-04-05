class AddBandToStudents < ActiveRecord::Migration
  def change
    add_column :students, :band, :boolean
  end
end
