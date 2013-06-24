class AddQualificationColumsToTrainers < ActiveRecord::Migration
  def self.up
    add_attachment :trainers, :qualification
  end

  def self.down
    remove_attachment :trainers, :qualification
  end

end
