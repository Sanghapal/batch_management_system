class ReportsController < ApplicationController
  def index
    @batch = Batch.find(params[:batch_id])
    @reports = @batch.reports

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end

  def new
    @batch = Batch.find(params[:batch_id])
    @report = @batch.reports.build
    @reports_students = ReportsStudents.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def create
    @batch = Batch.find(params[:batch_id])
    @report = @batch.reports.build(params[:report])
  p "Report in Params"
p params[:report]
@reports_students = ReportsStudents.new(params[:reports_students])
p "Another Params is,"
p params[:reports_students]
    respond_to do |format|
      if @report.save && @reports_students.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :no_content }
    end
  end
end
