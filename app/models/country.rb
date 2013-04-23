class Country < ActiveRecord::Base
  attr_accessible :name
  has_many :states
  has_many :cities, :through => :states
  has_many :students
  has_many :trainers
end
