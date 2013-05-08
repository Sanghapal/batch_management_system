class Admission < ActiveRecord::Base
  belongs_to :grade
  attr_accessible :fees, :qualifies_with, :grade_id
end
