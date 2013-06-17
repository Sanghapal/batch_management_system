class RemoveBlindnessFromStudents < ActiveRecord::Migration
  def self.up
    remove_attachment :students, :blindness
  end

  def self.down
    add_attachment :students, :blindness

  end

end
