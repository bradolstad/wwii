class UnitsController < ApplicationController

  before_filter :authenticate_user, except:[:show]

  def index
    @units = Unit.includes(:unit_type,:country).order(:name)
    @unit = Unit.new
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /units/1
  # GET /units/1.json
  def show
    @unit = Unit.find(params[:id])
    @events = @unit.events
    @markers = @unit.events.to_gmaps4rails
    @wiki = Wiki.new(@unit.name)
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end

  # GET /units/new
  # GET /units/new.json
  def new
    @unit = Unit.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /units/1/edit
  def edit
    @unit = Unit.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(params[:unit])

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  def update
    @unit = Unit.find(params[:id])

    respond_to do |format|
      if @unit.update_attributes(params[:unit])
        format.html { redirect_to @unit, notice: 'Unit was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to units_url }
      format.js
    end
  end
end
