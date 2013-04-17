class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(params[:subject])
    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_path, notice: 'Subject was successfully created.' }
        format.json { render json: @subject, status: :created, location: subjects_path }
      else
        format.html { render action: "new" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @subject = Subject.find(params[:id])
    respond_to do |format|
      if @subject.update_attributes(params[:subject])
        format.html { redirect_to subjects_path, notice: 'Subject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_multiple
    respond_to do |format|
      if params[:subjects] != nil
        Subject.destroy(params[:subjects])
        format.html { redirect_to subjects_url }
        format.json { head :no_content }
      else
        format.html { redirect_to subjects_url }
        format.json { head :no_content }
      end
    end
  end
end
