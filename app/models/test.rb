class Test < ActiveRecord::Base
  belongs_to :batch
  has_many :results
  has_many :students, :through => :results
  attr_accessible :test_date
end
