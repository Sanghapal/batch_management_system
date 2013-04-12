class AddColumnToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :student_fee, :float
    #add_column :grades, :sponsor_fee, :float
  end
end
