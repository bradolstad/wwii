class OperationsController < ApplicationController

  def index
    @operations = Operation.events?
    @operation = Operation.new

    @markers = {}.to_json
    @operations_data = Operation.data

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operations_data}
      format.js
    end
  end

  def show
    @operation = Operation.find(params[:id])

    @events ||= @operation.filtered_events

    @markers = @events.to_gmaps4rails

    @new_events = @events.map do |event|
      {
        event_id:event.id,
        date:event.event_date.to_i,
        name:event.name,
        lat:event.lat,
        lng:event.lng,
        tooltip:event.gmaps4rails_infowindow,
        marker_icon:""
        }
    end

    @wiki = Wiki.new(@operation.name)

    respond_to do |format|
      format.html
      format.json { render json: @new_events }
      format.js
    end
  end

  # GET /operations/new
  # GET /operations/new.json
  def new
    @operation = Operation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @operation }
      format.js
    end
  end

  # GET /operations/1/edit
  def edit
    @operation = Operation.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /operations
  # POST /operations.json
  def create
    @operation = Operation.new(params[:operation])

    respond_to do |format|
      if @operation.save
        format.html { redirect_to @operation, notice: 'Operation was successfully created.' }
        format.json { render json: @operation, status: :created, location: @operation }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def update
    @operation = Operation.find(params[:id])
    logger.info "@operation prior to update: #{@operation.inspect}"
    logger.info "params contains: #{params.inspect}"
    respond_to do |format|
      if @operation.update_attributes(params[:operation])
        format.html { redirect_to @operation, notice: 'Operation was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /operations/1
  # DELETE /operations/1.json
  def destroy
    @operation = Operation.find(params[:id])
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url }
      format.json { head :no_content }
      format.js
    end
  end
end
