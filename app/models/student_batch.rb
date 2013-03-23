class StudentBatch < ActiveRecord::Base
  belongs_to :Student
  belongs_to :Batch
  # attr_accessible :title, :body
end
