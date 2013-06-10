class LecturesController < ApplicationController
  def index
    @batch = Batch.find(params[:batch_id])
    @lectures = @batch.lectures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lectures }
    end
  end

  def show
    @lecture = Lecture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lecture }
    end
  end

  def new
    @batch = Batch.find(params[:batch_id])
    @lecture = @batch.lectures.build
    #@lecture = Lecture.new
    @presenty = Presenty.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lecture }
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def create
    @batch = Batch.find(params[:batch_id])
    @lecture = @batch.lectures.build
    @lecture.session_date = params[:lecture]["session_date"]
p "The Var is,"
p @lecture
#@lecture.save
p "The params is,"
p params
params["students"].each do |student_id|
p "Loop is,"
p student_id
  @presenty = @lecture.presenties.build
@presenty.attendent = params[:presenty][student_id][:attendent]
@presenty.done_homework = params[:presenty][student_id][:done_homework]
@presenty.student_id = student_id 
end

    respond_to do |format|
     if  @lecture.save
        format.html { redirect_to batch_lectures_path, notice: 'Session was successfully created.' }
        format.json { render json: @lecture, status: :created, location: @lecture }
      else
        format.html { render action: "new" }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @lecture = Lecture.find(params[:id])

    respond_to do |format|
      if @lecture.update_attributes(params[:lecture])
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy

    respond_to do |format|
      format.html { redirect_to batch_lectures_url }
      format.json { head :no_content }
    end
  end
end
