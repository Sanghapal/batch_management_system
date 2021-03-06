class Student < ActiveRecord::Base
  belongs_to :country
  belongs_to :state
  belongs_to :city
  has_many :presenties
  has_many :lectures, :through => :presenties
  has_many :results
  has_many :exams, :through => :results
  has_many :admissions
  has_many :grades, :through => :admissions
  has_and_belongs_to_many :batches
  attr_accessible :address_line1, :address_line2, :alternate_mobile, :email, :enrollment_date, :first_name, :last_name, :middle_name, :mobile, :qualifies_with, :sponsor, :zip_code, :state_id, :city_id, :country_id, :photo, :ban, :date_of_birth, :address_proof, :blindness_certificate, :address, :blindness
  has_attached_file :photo  
  has_attached_file :address  
  has_attached_file :blindness  


  
  attr_accessible :address_line1, :address_line2, :alternate_mobile, :email, :enrollment_date, :first_name, :last_name, :middle_name, :mobile, :zip_code, :state_id, :city_id, :country_id, :photo, :ban, :date_of_birth, :address_proof, :blindness_certificate
  has_attached_file :photo  

  validates :first_name, :last_name, :address_line1, :mobile, :enrollment_date, :zip_code,	:state_id, :city_id, :presence => true
  #validates :first_name,  :last_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}
  validates :middle_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}, :allow_blank => true
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i , :message => "Not a valid email address"}, :allow_blank => true
  validates :zip_code, :format => { :with => /^\d{6}$/, :message => "Please provide 6 digit pin code" }
  validates :mobile, :alternate_mobile, :format => { with: /(^\s*$|^\s*[789]\d{9}\s*$)/, :message => "Please provide 10 digit mobile number." }
  validates_attachment :photo, :presence => true, :content_type => { :content_type => ['image/jpg', 'image/png', 'image/jpeg']}
  validates_attachment :blindness, :presence => true, :content_type => { :content_type => ['image/jpg', 'image/png', 'image/jpeg']}
  #valid_presence_of :blindness, :message => "Please upload your blindness  "
validates_attachment_presence :blindness, :message => 'xxxx'

end
