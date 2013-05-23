class AddColumsToReportsStudents < ActiveRecord::Migration
  def change
    add_column :reports_students, :attendent, :boolean
    add_column :reports_students, :dune_homework, :boolean
  end
end
