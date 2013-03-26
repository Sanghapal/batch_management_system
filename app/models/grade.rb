class Grade < ActiveRecord::Base
   attr_accessible :title, :description
    has_and_belongs_to_many :students
  has_many :batches, :dependent => :destroy
  validates :title, :description, :presence => true 
end
