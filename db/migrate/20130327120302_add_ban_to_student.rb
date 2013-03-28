class AddBanToStudent < ActiveRecord::Migration
  def change
    add_column :students, :ban, :boolean
  end
end
