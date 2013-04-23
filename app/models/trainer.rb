class Trainer < ActiveRecord::Base
  attr_accessible :addreass_line2, :address_line1, :address_proof, :city_id, :email, :first_name, :last_name, :middle_name, :mobile, :photo, :qualification, :state_id, :zip_code
 

belongs_to :country
 belongs_to :state
  belongs_to :city
  
  

   validates :first_name, :last_name, :address_line1, :mobile,  :qualification, :zip_code,	:state, :city, :presence => true
  validates :first_name,  :last_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}
  validates :middle_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}, :allow_blank => true
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i , :message => "Not a valid email address"}, :allow_blank => true
  validates :zip_code, :format => { :with => /^\d{6}$/, :message => "Plesse provide 6 digit pin code" }
  validates :mobile, :format => { with: /(^\s*$|^\s*[789]\d{9}\s*$)/, :message => "Please provide 10 digit mobile number." }
  validates_attachment :photo, :presence => true, :content_type => { :content_type => ['image/jpg', 'image/png', 'image/jpeg']}
end