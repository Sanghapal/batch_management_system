class Student < ActiveRecord::Base
  belongs_to :country
  belongs_to :state
  belongs_to :city

  attr_accessible :address_line1, :address_line2, :alternate_mobile, :email, :enrollment_date, :first_name, :last_name, :middle_name, :mobile, :qualifies_with, :sponsor, :zip_code, :state_id, :city_id, :country_id, :photo
  has_attached_file :photo
    has_and_belongs_to_many :grades
  

  validates :first_name, :last_name, :address_line1, :mobile, :enrollment_date, :qualifies_with, :zip_code,	:state_id, :city_id, :presence => true
  validates :first_name,  :last_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}
  validates :middle_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}, :allow_blank => true
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i , :message => "Not a valid email address"}, :allow_blank => true
  validates :zip_code, :format => { :with => /^\d{6}$/, :message => "Plesse provide 6 digit pin code" }
  validates :mobile, :alternate_mobile, :format => { with: /(^\s*$|^\s*[789]\d{9}\s*$)/, :message => "Please provide 10 digit mobile number." }
  validates_attachment :photo, :presence => true, :content_type => { :content_type => ['image/jpg', 'image/png', 'image/jpeg']}
end
