class AddMobileToEnquiries < ActiveRecord::Migration
  def change
    add_column :enquiries, :mobile, :string
  end
end
