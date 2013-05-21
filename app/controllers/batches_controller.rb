class BatchesController < ApplicationController
  def index
    @grade = Grade.find(params[:grade_id])

    @batches = @grade.batches

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @batches }
    end
  end

  def show
    @batch = Batch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @batch }
    end
  end

  def new
    @grade = Grade.find(params[:grade_id])
    @batch = @grade.batches.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @batch }
    end
  end

  def edit
    @batch = Batch.find(params[:id])
  end

  def create
    @grade = Grade.find(params[:grade_id])
    @batch = @grade.batches.build(params[:batch])
    @batch.access_params(@grade)
    respond_to do |format|
      if @batch.save
        format.html { redirect_to grade_batches_path, notice: 'Batch was successfully created.' }
        format.json { render json: @batch, status: :created, location: @batch }
      else
        format.html { render action: "new" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
      @grade = Grade.find(params[:grade_id])
      @batch = @grade.batches.find(params[:id])
      @batch.access_params(@grade)
    respond_to do |format|
      if @batch.update_attributes(params[:batch])
        format.html { redirect_to grade_batches_path, notice: 'Batch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  def multipledelete
    respond_to do |format|

          if params[:batches] != nil
Batch.destroy(params[:batches])
      format.html { redirect_to grade_batches_url }
      format.json { head :no_content }
    end
  end
  end
def assignbatch
    #-------------------
    #Fetch those students in grade who aren't allotted to any of the batches
    #-------------------
    #for this, first get students allotted in batches of the grade
    @grade = Grade.includes(:batches => [:students]).find(params[:grade_id])
    @students = @grade.students
    #now build an array with ids of students who are already allotted batches
    @student_in_batch_ids = []
    @grade.batches.each do |btch|
      btch.students.each do |student|
        @student_in_batch_ids .push(student.id)
      end
	 if btch.id == params[:batch_id].to_i
    @batch = btch
      end
    end
    #finally, get those grade students who are not in any of the batches
    @stdnt = @grade.students.where("student_id NOT IN (?)", @student_in_batch_ids)

    if request.post?
    params[:students].each do |student_id|
    
    @batches_students  = BatchesStudents.new()
    @batches_students.batch_id = @batch.id
 @batches_students.student_id = student_id
  if @batches_students.save
# do nothing
else
p @batches_students
end
      end
    redirect_to grade_batches_path
          end

  end
	  def attendents
  if request.post?
    @batch = Batch.find(params[:batch_id])
    @session = Session.new(params[:session])
    @session.save
    redirect_to grade_batches_path
    end
    end
	    end