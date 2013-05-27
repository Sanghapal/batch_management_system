class ReportsStudents < ActiveRecord::Base
  belongs_to :student
  belongs_to :report
   attr_accessible :attendent, :dune_homework, :student_id
end
