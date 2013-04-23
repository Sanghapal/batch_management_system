class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :mobile
      t.string :email
      t.string :photo
      t.text :qualification
      t.string :address_line1
      t.string :addreass_line2
      t.string :state_id
      t.string :city_id
      t.integer :zip_code
      t.text :address_proof

      t.timestamps
    end
  end
end
