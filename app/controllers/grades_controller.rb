class GradesController < ApplicationController
  def index
    @grades = Grade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grades }
    end
  end

  def show
    @grade = Grade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grade }
    end
  end

  def new
    @grade = Grade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grade }
    end
  end
  def edit
    @grade = Grade.find(params[:id])
  end

  def create
    @grade = Grade.new(params[:grade])

    respond_to do |format|
      if @grade.save
        format.html { redirect_to grades_path, notice: 'Grade was successfully created.' }
        format.json { render json: @grade, status: :created, location: @grade }
      else
        format.html { render action: "new" }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @grade = Grade.find(params[:id])

    respond_to do |format|
      if @grade.update_attributes(params[:grade])
        format.html { redirect_to grades_path, notice: 'Grade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @grade = Grade.find(params[:id])
    @grade.destroy

    respond_to do |format|
      format.html { redirect_to grades_url }
      format.json { head :no_content }
    end
  end
end

  def multidelete
        @grade = Grade.find(params[:id])

    if @grade.params[:grade] != nil
        Grade.destroy(params[:id])
      redirect_to grades_path
    end
      end