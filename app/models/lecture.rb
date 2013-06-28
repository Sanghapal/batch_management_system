class Lecture < ActiveRecord::Base
  belongs_to :batch
  has_many :presenties
  has_many :students, :through => :presenties
  attr_accessible :assign_homework, :session_date, :remarks, :attribute_presenties
accepts_nested_attributes_for :presenties
end
