class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(params[:student])
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @student = Student.find(params[:id])
    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_multiple
    respond_to do |format|
      if params[:students] != nil
        Student.destroy(params[:students])
        format.html { redirect_to students_url }
        format.json { head :no_content }
      else
        format.html { redirect_to students_url }
        format.json { head :no_content }
      end
    end
  end

  def city
    @state = State.find(params[:state_id])    
    @cities = @state.cities
  end

  def state
    @country = Country.find(params[:country_id])
    @states = @country.states
  end
end
