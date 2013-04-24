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
    @trainers = Trainer.find(params[:trainers])
    @trainers.each do |trainer|
      p "--------"
      p trainer
      trainer.delete_flag = true
      trainer.update_attributes(params[:trainer])	
      redirect_to trainers_path
    end  
  end
end
