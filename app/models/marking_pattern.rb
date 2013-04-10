class MarkingPattern < ActiveRecord::Base
  belongs_to :grade
  belongs_to :subject
  attr_accessible :marks, :subject_id, :grade_id
end
