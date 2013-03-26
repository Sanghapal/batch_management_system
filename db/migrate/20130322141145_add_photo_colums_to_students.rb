class AddPhotoColumsToStudents < ActiveRecord::Migration
  def self.up
    add_attachment :students, :photo
  end

  def self.down
    remove_attachment :students, :photo
  end
end
