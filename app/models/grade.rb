class Grade < ActiveRecord::Base
   attr_accessible :title, :description, :student_fee, :sponsor_fee
    has_and_belongs_to_many :students
	
    has_and_belongs_to_many :subjects
  has_many :batches, :dependent => :destroy
  validates :title, :description, :presence => true 
end
