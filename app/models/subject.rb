class Subject < ActiveRecord::Base
  attr_accessible :subject
  has_many :marking_pattens
  has_many :grades, :through => :marking_pattens
end
