class GradesStudents < ActiveRecord::Base
  belongs_to :grade
  belongs_to :student
  # attr_accessible :title, :body
end
