class Exam < ActiveRecord::Base
  belongs_to :batch
  has_many :results
  has_many :students, :through => :results
  attr_accessible :exam_date, :batch_id
end
