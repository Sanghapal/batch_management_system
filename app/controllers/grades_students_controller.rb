class GradesStudentsController < ApplicationController
  # GET /grades_students
  # GET /grades_students.json
  def index
    @grades_students = GradesStudent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grades_students }
    end
  end

  # GET /grades_students/1
  # GET /grades_students/1.json
  def show
    @grades_student = GradesStudent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grades_student }
    end
  end

  # GET /grades_students/new
  # GET /grades_students/new.json
  def new
    @grades_studenst = GradesStudent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grades_student }
    end
  end

  # GET /grades_students/1/edit
  def edit
    @grades_student = GradesStudent.find(params[:id])
  end

  # POST /grades_students
  # POST /grades_students.json
  def create
    @grades_student = GradesStudent.new(params[:grades_student])

    respond_to do |format|
      if @grades_student.save
        format.html { redirect_to @grades_student, notice: 'Grades student was successfully created.' }
        format.json { render json: @grades_student, status: :created, location: @grades_student }
      else
        format.html { render action: "new" }
        format.json { render json: @grades_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grades_students/1
  # PUT /grades_students/1.json
  def update
    @grades_student = GradesStudents.find(params[:id])

    respond_to do |format|
      if @grades_student.update_attributes(params[:grades_student])
        format.html { redirect_to @grades_student, notice: 'Grades student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grades_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades_students/1
  # DELETE /grades_students/1.json
  def destroy
    @grades_student = GradesStudent.find(params[:id])
    @grades_student.destroy

    respond_to do |format|
      format.html { redirect_to grades_students_url }
      format.json { head :no_content }
    end
  end
end
