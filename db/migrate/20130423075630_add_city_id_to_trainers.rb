class AddCityIdToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :city_id, :integer
  end
end
