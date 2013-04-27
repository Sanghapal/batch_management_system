class Enquiry < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  attr_accessible :address_line1, :address_line2, :enquierd_for, :first_name, :last_name, :middle_name, :mobile, :zip_code, :state_id, :city_id
end
