class MarkingPatten < ActiveRecord::Base
  belongs_to :grade
  belongs_to :subject
  has_and_belongs_to_many :trainers
  has_many :results
  attr_accessible :marks, :grade_id, :student_id
end
