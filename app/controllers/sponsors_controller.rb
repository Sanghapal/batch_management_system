class SponsorsController < ApplicationController
  def index
    @sponsors = Sponsor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sponsors  }
    end
  end

  def show
    @sponsor  = Sponsor .find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sponsor }
    end
  end

  def new
    @sponsor = Sponsor .new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sponsor }
    end
  end
  def edit
    @sponsor  = Grade.find(params[:id])
  end

  def create
    @sponsor  = Sponsor .new(params[:sponsor ])

    respond_to do |format|
      if @sponsor .save
        format.html { redirect_to sponsors_path, notice: 'sponsor was successfully created.' }
        format.json { render json: @sponsor , status: :created, location: @sponsor  }
      else
        format.html { render action: "new" }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @sponsor = Sponsor .find(params[:id])

    respond_to do |format|
      if @sponsor .update_attributes(params[:sponsor ])
        format.html { redirect_to sponsors_path, notice: 'sponsor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

     def destroy
    @sopnsors = Batch.find(params[:id])
    @sopnsors.destroy

    respond_to do |format|
      format.html { redirect_to sopnsors_url }
      format.json { head :no_content }
    end
  end

      end
