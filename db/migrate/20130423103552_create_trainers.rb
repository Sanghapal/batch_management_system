class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :mobile_number
      t.string :email
      t.boolean :qualification
      t.string :address_line1
      t.string :address_line2
      t.references :country
      t.references :state
      t.references :city
      t.integer :zip_code
      t.boolean :address_proof

      t.timestamps
    end
    add_index :trainers, :country_id
    add_index :trainers, :state_id
    add_index :trainers, :city_id
  end
end
