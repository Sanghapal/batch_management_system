class Grade < ActiveRecord::Base
   attr_accessible :title, :description
  has_many :batches, :dependent => :destroy
  has_many :student_grades
  has_many :grades, :through => :student_grades
  validates :title, :description, :presence => true 
end
