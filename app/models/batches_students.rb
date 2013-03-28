class BatchesStudents < ActiveRecord::Base
  belongs_to :batch
  belongs_to :student
   attr_accessible :batch_id, :student_id 
end
