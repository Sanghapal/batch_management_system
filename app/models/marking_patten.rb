class MarkingPatten < ActiveRecord::Base
  belongs_to :grade
  belongs_to :subject
  attr_accessible :marks
end
