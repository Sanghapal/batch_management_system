class CreateAdmissions < ActiveRecord::Migration
  def change
    create_table :admissions do |t|
      t.references :grade
      t.text :fees
      t.string :qualifies_with

      t.timestamps
    end
    add_index :admissions, :grade_id
  end
end
