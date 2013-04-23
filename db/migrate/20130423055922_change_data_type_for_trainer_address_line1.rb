class ChangeDataTypeForTrainerAddressLine1 < ActiveRecord::Migration
  def up
	change_table :trainers do |t|
      t.change :address_line1, :string
    end
  end

  def down
	change_table :trainers do |t|
      t.change :address_line1, :text
    end
  end
end
