class Session < ActiveRecord::Base
  belongs_to :batch
has_and_belongs_to_many :students
  attr_accessible :assign_home, :session_date
end
