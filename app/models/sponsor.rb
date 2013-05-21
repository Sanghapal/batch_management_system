class Sponsor < ActiveRecord::Base
  belongs_to :country
  belongs_to :state
  belongs_to :city
  has_many :admissions
  attr_accessible :address_line1, :address_line2, :alternate_mobile, :email, :first_name, :last_name, :middle_name, :mobile_number, :pan_number, :pin_code, :country_id, :state_id, :city_id

  #validation
  validates :first_name, :last_name, :address_line1, :mobile_number,   :pin_code,	:state_id, :city_id, :email, :pan_number, :presence => true
  validates :first_name,  :last_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}
  validates :middle_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}, :allow_blank => true
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i , :message => "Not a valid email address"}
  validates :pin_code, :format => { :with => /^\d{6}$/, :message => "Plesse provide 6 digit pin code" }
  validates :mobile_number, :alternate_mobile, :format => { with: /(^\s*$|^\s*[789]\d{9}\s*$)/, :message => "Please provide 10 digit mobile number." }
  validates :pan_number, :length => { :is => 10 }, :allow_blank => true 
  validates :pan_number, :format => { :with => /\A[A-Z]{5}\d{4}[A-Z]{1}\Z/ , :message => 'invalid pan number'}, :allow_blank => true 
end
