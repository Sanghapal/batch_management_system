class CreateMarkingPattensTrainers < ActiveRecord::Migration
  def change
    create_table :marking_pattens_trainers do |t|
      t.references :marking_patten
      t.references :trainer

      t.timestamps
    end
    add_index :marking_pattens_trainers, :marking_patten_id
    add_index :marking_pattens_trainers, :trainer_id
  end
end
