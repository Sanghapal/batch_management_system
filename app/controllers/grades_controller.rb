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

  def multipledelete
    respond_to do |format|
      if params[:grades] != nil
        Grade.destroy(params[:grades])
        format.html { redirect_to grades_url }
        format.json { head :no_content }
      else
        format.html { redirect_to grades_url }
        format.json { head :no_content }
      end
    end
  end

  def subjects_list
    @grade = Grade.find(params[:grade_id])
    @marking_pattens = @grade.marking_pattens
    if @grade.subjects.count > 0
      @subjects = Subject.where("id NOT IN (?)", @grade.subjects)
    else
      @subjects = Subject.all
    end
    if request.post?
      params[:subjects].each do |subject_id|
	@marking_patten = MarkingPatten.new()
	@marking_patten.grade_id = @grade.id
	@marking_patten.subject_id = subject_id
	@marking_patten.save
      end
      redirect_to subjects_list_path
    end
  end

  def destroy_marking_patten
    @marking_patten = MarkingPatten.find(params[:marking_patten_id])
    @marking_patten.destroy

    respond_to do |format|
      format.html { redirect_to grades_path }
      format.json { head :no_content }
    end
  end
end