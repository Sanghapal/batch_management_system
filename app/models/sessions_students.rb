class SessionsStudents < ActiveRecord::Base
  belongs_to :student
  belongs_to :session
  # attr_accessible :title, :body
end
