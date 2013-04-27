class Sponsor < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :last_name, :middle_name, :pan_number, :phone
end


validates :first_name, :last_name, :address, :phone, :pan_number, :email, :presence => true
  validates :first_name,  :last_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}
  validates :middle_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}, :allow_blank => true
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i , :message => "Not a valid email address"}
  validates :phone, :format => { :with => /(^\s*$|^\s*[789]\d{9}\s*$)/, :message => "Please provide 10 digit mobile number." }
  validates :pan_number, :format => {:with => /[A-Z]{5}\d{4}[A-Z]{1}/, :message => "is not in a format of AAAAA9999A."}