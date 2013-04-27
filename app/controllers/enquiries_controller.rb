class EnquiriesController < ApplicationController
before_filter :load_country_state_city, :except => [:destroy, :show]

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
	 Enquiry.destroy(params[:enquiries])
      format.html { redirect_to enquiries_url }
        format.json { head :no_content }
      else
        format.html { redirect_to enquiries_url }
        format.json { head :no_content }
      end
    end
   end



  def city
    @state = State.find(params[:state_id])    
    @cities = @state.cities
    render :update do |page|
      page.replace_html "cities", :partial => "city", :object => @cities
    end
  end

  def state
    @country = Country.find(params[:country_id])
    @states = @country.states
  end

def studentinfo
end
  
end
