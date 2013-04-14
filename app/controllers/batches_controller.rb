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

    #@batch = Batch.find(params[:id])
 @batch = @grade.batches.find(params[:id])
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
end