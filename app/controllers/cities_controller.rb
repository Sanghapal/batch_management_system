class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def edit
    @city = City.find(params[:id])
  end

  def create
    @city = City.new(params[:city])
    respond_to do |format|
      if @city.save
        format.html { redirect_to cities_path, notice: 'City was successfully created.' }
        format.json { render json: cities_path, status: :created, location: @city }
      else
        format.html { render action: "new" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @city = City.find(params[:id])
    respond_to do |format|
      if @city.update_attributes(params[:city])
        format.html { redirect_to cities_path, notice: 'City was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_multiple
    respond_to do |format|
      if params[:cities] != nil
        City.destroy(params[:cities])
        format.html { redirect_to cities_url }
        format.json { head :no_content }
      else
        format.html { redirect_to cities_url }
        format.json { head :no_content }
      end
    end
  end
end
