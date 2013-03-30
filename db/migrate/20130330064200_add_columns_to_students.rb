class AddColumnsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :mobile, :string
    add_column :students, :alternate_mobile, :string
  end
end
