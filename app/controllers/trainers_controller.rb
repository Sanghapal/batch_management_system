class TrainersController < ApplicationController
  before_filter :load_country_state_city, :except => [:destroy, :show]

  def index
    @trainers = Trainer.all
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
    respond_to do |format|
      if @trainer.save
        format.html { redirect_to @trainer, notice: 'Trainer successfully created'}
        format.json { render json: @trainer, status: :created, location: @trainer }
      else
p @trainer.errors
        format.html { render action: "new" }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @trainer = Trainer.find(params[:id])
    respond_to do |format|
      if @trainer.update_attributes(params[:trainer])
        format.html { redirect_to @trainer, notice: 'trainer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trainer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_multiple
    respond_to do |format|
      if params[:trainers] != nil
        Trainer.destroy(params[:trainers])
        format.html { redirect_to trainers_url }
        format.json { head :no_content }
      else
        format.html { redirect_to trainers_url }
        format.json { head :no_content }
      end
    end
  end

  end