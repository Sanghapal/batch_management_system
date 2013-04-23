class RemoveStateFromTrainers < ActiveRecord::Migration
  def up
    remove_column :trainers, :state_id
  end

  def down
    add_column :trainers, :state_id, :string
  end
end
