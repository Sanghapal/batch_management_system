class AddAddressColumsToStudents < ActiveRecord::Migration
  def self.up
    add_attachment :students, :address
  end

  def self.down
    remove_attachment :students, :address

  end



end
