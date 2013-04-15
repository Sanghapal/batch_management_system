class Grade < ActiveRecord::Base
   attr_accessible :title, :description, :student_fee, :sponsor_fee, :batch_duration, :session_duration
    has_and_belongs_to_many :students
    has_many :marking_pattens
    has_many :subjects, :through => :marking_pattens
   has_many :batches, :dependent => :destroy
  validates :title, :description, :presence => true 
end
