class RemoveAddressFromStudents < ActiveRecord::Migration
  def self.up
    remove_attachment :students, :address
  end

  def self.down
    add_attachment :students, :address

  end

end
