class RemoveColumnsToStudents < ActiveRecord::Migration
  def up
    remove_column :students, :alternate_mobile
    remove_column :students, :mobile
  end

  def down
    add_column :students, :mobile, :integer
    add_column :students, :alternate_mobile, :integer
  end
end
