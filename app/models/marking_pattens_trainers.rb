class MarkingPattensTrainers < ActiveRecord::Base
  belongs_to :marking_patten
  belongs_to :trainer
  attr_accessible :marking_patten_id, :trainer_id

end
