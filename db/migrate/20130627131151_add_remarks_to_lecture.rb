class AddRemarksToLecture < ActiveRecord::Migration
  def change
    add_column :lectures, :remarks, :string
  end
end
