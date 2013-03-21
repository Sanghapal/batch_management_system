class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :title
      t.references :grade
      t.date :starte_date
      t.date :end_date
      t.text :deys_of_week
      t.time :from_time
      t.time :end_time
      
      t.timestamps
    end
  end
end
