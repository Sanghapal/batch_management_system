class State < ActiveRecord::Base
  attr_accessible :name, :country_id
  has_many :cities
  has_one :student
  belongs_to :country

  validates :name, :country_id, :presence => true
  validates :name, uniqueness: true
  validates :name, :format => {:with => /\A[a-zA-z\s]+\z/, :message => "Only letters allowed."}
end
