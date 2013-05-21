class Admission < ActiveRecord::Base
  belongs_to :grade
  belongs_to :student
  belongs_to :sponsor
  attr_accessible :admission_date, :qualifies_with, :sponsor_fee, :sponsor_flag, :student_fee, :student_id, :grade_id, :sponsor_id 
end
