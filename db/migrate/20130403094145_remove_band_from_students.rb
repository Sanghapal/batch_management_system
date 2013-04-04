class RemoveBandFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :band
  end

  def down
    add_column :students, :band, :string
  end
end
