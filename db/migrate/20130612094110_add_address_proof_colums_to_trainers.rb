class AddAddressProofColumsToTrainers < ActiveRecord::Migration
    def self.up
    add_attachment :trainers, :address_proof
  end

  def self.down
    remove_attachment :trainers, :address_proof
  end
end
