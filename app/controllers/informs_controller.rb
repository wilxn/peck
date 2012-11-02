class InformsController < ApplicationController
  # GET /informs
  # GET /informs.json
  def index
    @informs = Inform.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @informs }
    end
  end

  # GET /informs/1
  # GET /informs/1.json
  def show
    @inform = Inform.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inform }
    end
  end

  # GET /informs/new
  # GET /informs/new.json
  def new
    @inform = Inform.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inform }
    end
  end

  # GET /informs/1/edit
  def edit
    @inform = Inform.find(params[:id])
  end

  # POST /informs
  # POST /informs.json
  def create
    @inform = Inform.new(params[:inform])

    respond_to do |format|
      if @inform.save
        format.html { redirect_to @inform, notice: 'Inform was successfully created.' }
        format.json { render json: @inform, status: :created, location: @inform }
      else
        format.html { render action: "new" }
        format.json { render json: @inform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /informs/1
  # PUT /informs/1.json
  def update
    @inform = Inform.find(params[:id])

    respond_to do |format|
      if @inform.update_attributes(params[:inform])
        format.html { redirect_to @inform, notice: 'Inform was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informs/1
  # DELETE /informs/1.json
  def destroy
    @inform = Inform.find(params[:id])
    @inform.destroy

    respond_to do |format|
      format.html { redirect_to informs_url }
      format.json { head :no_content }
    end
  end
end
