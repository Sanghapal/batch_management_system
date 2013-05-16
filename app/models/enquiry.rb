class Enquiry < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  attr_accessible :address_line1, :address_line2, :enquierd_for, :first_name, :last_name, :middle_name, :mobile, :zip_code, :state_id, :city_id

  #validation
  validates :first_name, :last_name, :address_line1, :mobile, :zip_code, :state_id, :city_id, :enquierd_for, :presence => true
  validates :first_name,  :last_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}
  validates :middle_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}, :allow_blank => true
  validates :zip_code, :format => { :with => /^\d{6}$/, :message => "Plesse provide 6 digit pin code" }
  validates :mobile,  :format => { with: /(^\s*$|^\s*[789]\d{9}\s*$)/, :message => "Please provide 10 digit mobile number." }
end
