class City < ActiveRecord::Base
  belongs_to :state
  has_many :trainers

 has_many :students
  attr_accessible :name, :state_id 

  validates :name, :state_id, :presence => true
  validates :name, :format => {:with => /\A[a-zA-z\s]+\z/, :message => "Only letters allowed."}
end
