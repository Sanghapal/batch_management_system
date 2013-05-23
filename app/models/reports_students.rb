class ReportsStudents < ActiveRecord::Base
  belongs_to :student
  belongs_to :report
  # attr_accessible :title, :body
end
