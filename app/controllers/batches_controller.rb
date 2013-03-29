class BatchesController < ApplicationController
  def index
    @batches = Batch.all

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
    @batch = Batch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @batch }
    end
  end
  def edit
    @batch = Batch.find(params[:id])
  end

  def create
    @batch = Batch.new(params[:batch])

    respond_to do |format|
      if @batch.save
        format.html { redirect_to batches_path, notice: 'Batch was successfully created.' }
        format.json { render json: @batch, status: :created, location: @batch }
      else
        format.html { render action: "new" }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @batch = Batch.find(params[:id])

    respond_to do |format|
      if @batch.update_attributes(params[:batch])
        format.html { redirect_to batches_path, notice: 'Batch was successfully updated.' }
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
      format.html { redirect_to batches_url }
      format.json { head :no_content }
    end
  end
end
end