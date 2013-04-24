class AddDateOfBirthToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :date_of_birth, :date
  end
end
