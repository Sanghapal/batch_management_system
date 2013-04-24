class AddDeleteFlagToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :delete_flag, :boolean
  end
end
