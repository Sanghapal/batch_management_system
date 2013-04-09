class Sponsor < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :last_name, :middle_name, :pan_number, :phone
end
