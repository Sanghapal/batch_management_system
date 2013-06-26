class Result < ActiveRecord::Base
  belongs_to :exam
  belongs_to :student
  belongs_to :marking_patten
  attr_accessible :marks, :exam_id, :student_id, :marking_patten_id
end
