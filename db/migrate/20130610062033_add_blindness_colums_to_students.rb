class AddBlindnessColumsToStudents < ActiveRecord::Migration
  def self.up
    add_attachment :students, :blindness
  end

  def self.down
    remove_attachment :students, :blindness

  end

end
