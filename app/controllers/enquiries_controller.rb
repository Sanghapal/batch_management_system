class EnquiriesController < ApplicationController

  def index
    @enquiries = Enquiry.all
  end

  def show
    @enquiry = Enquiry.find(params[:id])
  end

  def new
    @enquiry = Enquiry.new
  end

  def edit
    @enquiry = Enquiry.find(params[:id])
  end

  def create
    @enquiry = Enquiry.new(params[:enquiry])
    respond_to do |format|
      if @enquiry.save
        format.html { redirect_to @enquiry, notice: 'Enquiry successfully ' }
        format.json { render json: @enquiry, status: :created, location: @enquiry }
      else
p @enquiry.errors
        format.html { render action: "new" }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @enquiry = Enquiry.find(params[:id])
    respond_to do |format|
      if @enquiry.update_attributes(params[:enquiry])
        format.html { redirect_to @enquiry, notice: 'Enqury of student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @enquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_multiple
    respond_to do |format|
      if params[:enquiries] !=nil
      p "------------"
        p params[:enquiries]
	Enquiry.destroy(params[:enquiries])
        format.html { redirect_to enquiries_path }
        format.json { head :no_content }
      else
        format.html { redirect_to enquiries_path }
        format.json { head :no_content }
      end
    end
   end

  def studentinfo
  end
end
