class StudentGrade < ActiveRecord::Base
  belongs_to :Student
  belongs_to :Grade
   attr_accessible :addmition_date
end
