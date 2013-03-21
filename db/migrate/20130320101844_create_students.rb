class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.integer :mobile
      t.integer :alternate_mobile
      t.references :state
      t.references :city
      t.string :address_line1
      t.string :address_line2
      t.integer :zip_code
      t.string :qualifies_with
      t.date :enrollment_date
      t.boolean :sponsor

      t.timestamps
    end
    add_index :students, :state_id
    add_index :students, :city_id
  end
end
