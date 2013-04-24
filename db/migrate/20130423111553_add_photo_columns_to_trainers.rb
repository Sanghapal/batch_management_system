class AddPhotoColumnsToTrainers < ActiveRecord::Migration
  def self.up
    add_attachment :trainers, :photo
  end

  def self.down
    remove_attachment :trainers, :photo
  end
end
