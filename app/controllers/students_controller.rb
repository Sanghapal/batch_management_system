class StudentsController < ApplicationController
  before_filter :load_country_state_city, :except => [:destroy, :show]

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
#    @student.grades.build
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
    render :update do |page|
      page.replace_html "cities", :partial => "city", :object => @cities
    end
  end

  def state
    @country = Country.find(params[:country_id])
    @states = @country.states
  end

def addgrade  
  if request.post?
    @student = GradesStudents.new(params[:grades_students])
    @student.admission_date = Date.today
    respond_to do |format|
      if @student.save
        format.html { redirect_to students_path, notice: 'assign grade successfully..' }
        format.json { render json: students_path, status: :created, location: @student }
      else
        format.html { render action: "addgrade" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
 end


  def banmultiple

    @student = Student.find(params[:id])

    if request.put?
        respond_to do |format|

        @student.ban = true    
p @student
        @student.update_attributes(params[:student])
        format.html { redirect_to students_path, notice: 'assign grade successfully..' }
	
    end
  end
end
  def assign_batch_multiple    
    @grade = Grade.find(params[:grade_id])
    @students = @grade.students
     if request.post?
      @students = BatchesStudents.new(params[:batches_students])
      respond_to do |format|
        if @student.save
          format.html { redirect_to students_path, notice: 'assign batch successfully..' }
          format.json { render json: students_path, status: :created, location: @student }
        else
          format.html { render action: "assign_batch" }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
    end
  end
end		
