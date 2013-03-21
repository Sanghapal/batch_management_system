class State < ActiveRecord::Base
  attr_accessible :name
  has_many :cities
  has_one :student

  validates :name, :presence => true
  validates :name, :format => {:with => /\A[a-zA-z\s]+\z/, :message => "Only letters allowed."}
end
