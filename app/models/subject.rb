class Subject < ActiveRecord::Base
  attr_accessible :subject
  
  has_and_belongs_to_many :grades
end
