class ExamsController < ApplicationController
  def index
    @exams = Exam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exams }
    end
  end

  def show
    @exam = Exam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam }
    end
  end

  def new
    @batch = Batch.find(params[:batch_id])
    @exam = @batch.exams.build
    @result = Result.new
    @grade = @batch.grade

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam }
    end
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def create
    @batch = Batch.find(params[:batch_id])
    @exam = @batch.exams.build
    @grade = @batch.grade

    @exam.exam_date = params[:exam][:exam_date]
p "The params is,"
p params
    params[:marks].keys.each do |student_id|
p "stid="+student_id
    params["marks"][student_id].keys.each do |marking_patten|
    p "--mp="+marking_patten
      @result = @exam.results.build

          @result.marks = params[:marks][student_id][marking_patten]
	  @result.student_id = student_id
    @result.marking_patten_id =marking_patten
    end#marking pattern loop
end#student id loop
    respond_to do |format|
      if @exam.save
        format.html { redirect_to batch_exams_path, notice: 'Exam was successfully created.' }
        format.json { render json: @exam, status: :created, location: @exam }
      else
        format.html { render action: "new" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @exam = Exam.find(params[:id])

    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to exams_url }
      format.json { head :no_content }
    end
  end
end
