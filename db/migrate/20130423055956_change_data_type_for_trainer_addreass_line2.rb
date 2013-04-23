class ChangeDataTypeForTrainerAddreassLine2 < ActiveRecord::Migration
  def up
	change_table :trainers do |t|
      t.change :addreass_line2, :string
    end
  end

  def down
	change_table :trainers do |t|
      t.change :addreass_line2, :text
    end
  end
end

