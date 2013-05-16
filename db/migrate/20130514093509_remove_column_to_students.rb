class RemoveColumnToStudents < ActiveRecord::Migration
  def up
    remove_column :students, :qualifies_with
    remove_column :students, :sponsor
  end

  def down
    add_column :students, :sponsor, :boolean
    add_column :students, :qualifies_with, :string
  end
end
