class ChangeDataTypeForTrainerEmail < ActiveRecord::Migration
  def up
	change_table :trainers do |t|
      t.change :email, :string
    end
  end

  def down
	change_table :trainers do |t|
      t.change :email, :text
    end
  end
end

