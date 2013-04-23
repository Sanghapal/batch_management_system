class Grade < ActiveRecord::Base
   attr_accessible :title, :description, :student_fee, :sponsor_fee, :batch_duration, :session_duration
    has_and_belongs_to_many :students
    has_many :marking_pattens
    has_many :subjects, :through => :marking_pattens
   has_many :batches, :dependent => :destroy
  validates :title, :description, :presence => true 
  validates :session_duration,:format => { :with => /^[0-2][0-3]:[0-5][0-9]$/, :message => "Not a valid time"}, :allow_blank => false

end
