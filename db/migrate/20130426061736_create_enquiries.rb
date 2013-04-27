class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.references :city
      t.references :state
      t.integer :mobile
      t.string :address_line1
      t.string :address_line2
      t.integer :zip_code
      t.text :enquierd_for

      t.timestamps
    end
    add_index :enquiries, :city_id
    add_index :enquiries, :state_id
  end
end
