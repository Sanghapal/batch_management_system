class RemoveMobileToEnquiries < ActiveRecord::Migration
  def up
    remove_column :enquiries, :mobile
  end

  def down
    add_column :enquiries, :mobile, :integer
  end
end
