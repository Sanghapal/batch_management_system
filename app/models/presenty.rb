class Presenty < ActiveRecord::Base
  belongs_to :student
  belongs_to :lecture
  attr_accessible :attendent, :done_homework, :student_id
end
