class RemoveCityFromTrainers < ActiveRecord::Migration
  def up
    remove_column :trainers, :city
  end

  def down
    add_column :trainers, :city, :string
  end
end
