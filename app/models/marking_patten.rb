class MarkingPatten < ActiveRecord::Base
  belongs_to :grade
  belongs_to :subject
  attr_accessible :marks, :grade_id, :student_id
end
