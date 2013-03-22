class StatesController < ApplicationController

  def index
    @states = State.all
  end

  def new
    @state = State.new
  end


  def edit
    @state = State.find(params[:id])
  end

  def create
    @state = State.new(params[:state])
    respond_to do |format|
      if @state.save
        format.html { redirect_to states_path, notice: 'State was successfully created.' }
        format.json { render json: states_path, status: :created, location: @state }
      else
        format.html { render action: "new" }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @state = State.find(params[:id])
    respond_to do |format|
      if @state.update_attributes(params[:state])
        format.html { redirect_to states_path, notice: 'State was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_multiple
    respond_to do |format|
      if params[:states] != nil
        State.destroy(params[:states])
        format.html { redirect_to states_url }
        format.json { head :no_content }
      else
        format.html { redirect_to states_url }
        format.json { head :no_content }
      end
    end
  end
end
