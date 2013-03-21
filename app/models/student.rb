class Student < ActiveRecord::Base
  belongs_to :state
  belongs_to :city
  attr_accessible :address_line1, :address_line2, :alternate_mobile, :email, :enrollment_date, :first_name, :last_name, :middle_name, :mobile, :qualifies_with, :sponsor, :zip_code

  validates :first_name, :last_name, :address_line1, :mobile, :enrollment_date, :qualifies_with, :zip_code,	:state_id, :city_id, :presence => true
  validates :first_name, :middle_name, :last_name, :format => {:with => /\A[a-zA-z]+\z/, :message => "Only letters allowed."}
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i , :message => "Not a valid email address"}, :allow_blank => true
  validates :mobile, :zip_code, :numericality => { :only_integer => true} 
  validates :alternate_mobile, :numericality => { :only_integer => true}, :allow_nil => true
  validates :mobile, :alternate_mobile, :length => {:is => 10} 
  validates :zip_code, :length => { :is => 6 }
end
