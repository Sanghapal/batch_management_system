class Student < ActiveRecord::Base
  belongs_to :country
  belongs_to :state
  belongs_to :city
  has_many :student_grades
  has_many :grades, :through => :student_grades
  has_many :student_batches
  has_many :batches, :through => :student_batches
  
  attr_accessible :address_line1, :address_line2, :alternate_mobile, :email, :enrollment_date, :first_name, :last_name, :middle_name, :mobile, :qualifies_with, :sponsor, :zip_code, :state_id, :city_id, :country_id

  validates :first_name, :last_name, :address_line1, :mobile, :enrollment_date, :qualifies_with, :zip_code,	:state_id, :city_id, :presence => true
  validates :first_name,  :last_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}
  validates :middle_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}, :allow_blank => true
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i , :message => "Not a valid email address"}, :allow_blank => true
  validates :zip_code, :format => { :with => /^\d{6}$/, :message => "Plesse provide 6 digit pin code" }
  validates :mobile, :alternate_mobile, :format => { with: /(^\s*$|^\s*[789]\d{9}\s*$)/, :message => "Enter a valide mobile number." }
end
