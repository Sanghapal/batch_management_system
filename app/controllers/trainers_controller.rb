class TrainersController < ApplicationController

  def index
 @trainers = Trainer.where(:delete_flag => false)

   
    end

  def show
    @trainer = Trainer.find(params[:id])
  end

  def new
    @trainer = Trainer.new
  end

  def edit
    @trainer = Trainer.find(params[:id])
  end

  def create
    @trainer = Trainer.new(params[:trainer])
    @trainer.delete_flag = false
    respond_to do |format|
      if @trainer.save
        format.html { redirect_to @trainer, notice: 'Trainer was successfully created.' }
        format.json { render json: @trainer, status: :created, location: @trainer }
      else
        format.html { render action: "new" }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

   def update
    @trainer = Trainer.find(params[:id])
    respond_to do |format|
      if @trainer.update_attributes(params[:trainer])
        format.html { redirect_to @trainer, notice: 'Trainer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_multiple
    if params[:trainers] != nil
     Trainer.destroy(params[:trainers])
      redirect_to trainers_path
    end  
  end


def ability
   @marking_pattens = MarkingPatten.all  
if request.post?
params[:grade].each do |g|
@var =  MarkingPattensTrainers.new()
@var.trainer_id = params[:trainer_id]
@var.marking_patten_id = g
p "params is,"
p params
p "the var is,"
p @var
if @var.save

end
end
redirect_to trainers_path

  end

end

def display
@trainer = Trainer.find(params[:trainer_id])
end
end