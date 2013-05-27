class Report < ActiveRecord::Base
  belongs_to :batch
has_and_belongs_to_many :students
  attr_accessible :assign_homework, :session_date, :batch_id
end
