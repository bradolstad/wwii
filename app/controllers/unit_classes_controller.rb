class UnitClassesController < ApplicationController
  before_filter :authenticate_user

  def index
    @unit_classes = UnitClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unit_classes }
    end
  end

  # GET /unit_classes/1
  # GET /unit_classes/1.json
  def show
    @unit_class = UnitClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unit_class }
    end
  end

  # GET /unit_classes/new
  # GET /unit_classes/new.json
  def new
    @unit_class = UnitClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unit_class }
    end
  end

  # GET /unit_classes/1/edit
  def edit
    @unit_class = UnitClass.find(params[:id])
  end

  # POST /unit_classes
  # POST /unit_classes.json
  def create
    @unit_class = UnitClass.new(params[:unit_class])

    respond_to do |format|
      if @unit_class.save
        format.html { redirect_to @unit_class, notice: 'Unit class was successfully created.' }
        format.json { render json: @unit_class, status: :created, location: @unit_class }
      else
        format.html { render action: "new" }
        format.json { render json: @unit_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unit_classes/1
  # PUT /unit_classes/1.json
  def update
    @unit_class = UnitClass.find(params[:id])

    respond_to do |format|
      if @unit_class.update_attributes(params[:unit_class])
        format.html { redirect_to @unit_class, notice: 'Unit class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unit_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_classes/1
  # DELETE /unit_classes/1.json
  def destroy
    @unit_class = UnitClass.find(params[:id])
    @unit_class.destroy

    respond_to do |format|
      format.html { redirect_to unit_classes_url }
      format.json { head :no_content }
    end
  end
end
