class Batch < ActiveRecord::Base
  attr_accessible :title, :grade_id, :starte_date, :end_date, :deys_of_week, :from_time, :end_time
  belongs_to :grade
  has_and_belongs_to_many :students

  validates :title, :grade, :starte_date, :end_date, :deys_of_week, :from_time, :end_time, :presence => true 
  validate :checkdate
  validate :mytime
  validate :caldate
  def checkdate
    if end_date && starte_date
      errors.add(:end_date, "End date should not be smaller than start date ") if end_date < starte_date
    end
  end
  def caldate
errors.add(:end_date, " You have entered invalid date")     if end_date > Date.month(4).starte_date

    end
  end
  def mytime
    if end_time && from_time
      errors.add(:from_time, "Please enter valid time") if end_time < from_time
    end
 end
end
