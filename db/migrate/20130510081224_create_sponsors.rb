class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :email
      t.string :pan_number
      t.string :address_line1
      t.string :address_line2
      t.references :country
      t.references :state
      t.references :city
      t.integer :pin_code
      t.string :mobile_number
      t.string :alternate_mobile

      t.timestamps
    end
    add_index :sponsors, :country_id
    add_index :sponsors, :state_id
    add_index :sponsors, :city_id
  end
end
