class CreateAdmissions < ActiveRecord::Migration
  def change
    create_table :admissions do |t|
      t.references :grade
      t.references :student
      t.string :student_fee
      t.string :sponsor_fee
      t.references :sponsor
      t.string :qualifies_with
      t.date :admission_date
      t.boolean :sponsor_flag

      t.timestamps
    end
    add_index :admissions, :grade_id
    add_index :admissions, :student_id
    add_index :admissions, :sponsor_id
  end
end
