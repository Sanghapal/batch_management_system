class StudentGrade < ActiveRecord::Base
  belongs_to :Student
  belongs_to :Grade
  # attr_accessible :title, :body
end
