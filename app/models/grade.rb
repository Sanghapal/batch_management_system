class Grade < ActiveRecord::Base
   attr_accessible :title, :description
  has_many :batches, :dependent => :destroy
  validates :title, :description, :presence => true 
end
