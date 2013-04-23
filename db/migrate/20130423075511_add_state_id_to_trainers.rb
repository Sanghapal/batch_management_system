class AddStateIdToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :state_id, :integer
  end
end
