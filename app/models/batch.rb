class Batch < ActiveRecord::Base
  attr_accessible :title, :grade_id, :starte_date, :end_date, :deys_of_week, :from_time, :end_time
  belongs_to :grade
  has_and_belongs_to_many :students

  validates :title, :grade, :starte_date, :end_date, :deys_of_week, :from_time, :end_time, :presence => true 
  validate :checkdate
  validate :mytime
  validate :caldate
validate :countdate
validate :cal_time
validate :counttime

  def access_params(params)
    @grade_params = params
  end

  def checkdate
    if end_date && starte_date
      errors.add(:end_date, "End date should not be smaller than start date ") if end_date < starte_date
    end
  end

  def caldate
      batch_duration_month = nil
    if end_date && starte_date
      batch_duration_month = @grade_params.batch_duration.to_i
     errors.add(:end_date, "needs to be  #{batch_duration_month} months after start date") if end_date < starte_date+batch_duration_month.months-1.day
end
end

  def countdate
    batch_duration_munth = nil
    if end_date && starte_date
      batch_duration_month = @grade_params.batch_duration.to_i
    errors.add(:end_date, "needs to be #{batch_duration_month} months after start date") if end_date > starte_date+batch_duration_month.months-1.day
end
end

  def mytime
    if end_time && from_time
      errors.add(:from_time, "Please enter valid time") if end_time < from_time
    end
 end

  def cal_time
     
    if end_time && from_time
      errors.add(:end_time, "needs to be 2:30 minutes after start time") if end_time < from_time+2.hours+30.minutes
  end
end

def counttime
    if end_time && from_time
    errors.add(:end_time, "needs to be 2:30 minutes after start time") if end_time > from_time+2.hours+30.minutes
  end
end
end