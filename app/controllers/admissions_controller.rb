class AdmissionsController < ApplicationController
  def index
    @admissions = Admission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admissions }
    end
  end

  def show
    @admission  = Admission .find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admission }
    end
  end

  def new
    @admission = Admission .new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admission }
    end
  end
  def edit
    @admission = Admission.find(params[:id])
  end

  def create
    @admission  = Admission .new(params[:admission ])

    respond_to do |format|
      if @admission .save
        format.html { redirect_to admissions_path, notice: 'admissionwas successfully created.' }
        format.json { render json: @admission , status: :created, location: @admission  }
      else
        format.html { render action: "new" }
        format.json { render json: @admission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @admission = Admission .find(params[:id])

    respond_to do |format|
      if @admission .update_attributes(params[:admission])
        format.html { redirect_to admissions_path, notice: 'admission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admission.errors, status: :unprocessable_entity }
      end
    end
  end

     def destroy_multiple
	 respond_to do |format|
 if params[:admissions] !=nil
	 Admission.destroy(params[:admissions])
      format.html { redirect_to admissions_url }
        format.json { head :no_content }
      else
        format.html { redirect_to admissions_url }
        format.json { head :no_content }
      end
    end
   end

end

