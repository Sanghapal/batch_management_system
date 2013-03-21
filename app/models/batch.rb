class Batch < ActiveRecord::Base
  attr_accessible :title, :starte_date, :end_date, :deys_of_week, :from_time, :end_time
  belongs_to :grade
  validates :title, :grade, :starte_date, :end_date, :deys_of_week, :from_time, :end_time, :presence => true 
  validate :checkdate
  def checkdate
    if end_date && starte_date
      errors.add(:end_date, "End date should not be smaller than start date ") if end_date < starte_date
    end
  end
end
