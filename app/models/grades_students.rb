class GradesStudents < ActiveRecord::Base
  belongs_to :grade
  belongs_to :student
   attr_accessible :grade_id, :student_id, :admission_date
end
