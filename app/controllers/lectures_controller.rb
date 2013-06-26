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
    @presenty = @lecture.presenties.build
  end

  def create
    @batch = Batch.find(params[:batch_id])
    @lecture = @batch.lectures.build
    @lecture.session_date = params[:lecture][:session_date]
    @lecture.assign_homework = params[:lecture][:assign_homework]
p "The Var is,"
p @lecture
p "The params is,"
p params
p "students var is,"
p params[:students]

params["students"].each do |student_id|
p "Loop is,"
p student_id
p "Presenty is,"
p params[:presenty]
p "wove nice" if params[:presenty].has_key?(student_id)
  @presenty = @lecture.presenties.build
if params[:presenty].has_key?(student_id)
@presenty.student_id = student_id

  if params[:presenty][student_id].has_key?(:done_homework)
    @presenty.done_homework = params[:presenty][student_id][:done_homework]
  end
  if params[:presenty][student_id].has_key?(:attendent)
    @presenty.attendent = params[:presenty][student_id][:attendent]
  end
end#student_id key check 

end

    respond_to do |format|
     if  @lecture.save
p "my var"
        format.html { redirect_to batch_lectures_path, notice: 'Session was successfully created.' }
        format.json { render json: @lecture, status: :created, location: @lecture }
      else
p "Error in var"
p @lecture
        format.html { render action: "new" }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @lecture = Lecture.find(params[:id])
@lecture.presenties
p "the params is,"
p params
     @lecture.presenties.each do |presenty|
p "The presenty is,"
p presenty
p "second params is,"
   p params[:presenty]
end
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
