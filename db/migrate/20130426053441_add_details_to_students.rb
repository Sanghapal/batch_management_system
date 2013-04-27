class AddDetailsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :date_of_birth, :date
    add_column :students, :address_proof, :boolean
    add_column :students, :blindness_certificate, :boolean
  end
end
