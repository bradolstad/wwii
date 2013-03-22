class OperationsController < ApplicationController

  before_filter :authenticate_user, except:[:show]

  def index
    @operations = Operation.events?
    @operation = Operation.new

    @operations_data = Operation.data

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @operations_data}
      format.js
    end
  end

  def show
    @operation = Operation.find(params[:id])

    min = (Time.at(params[:start].to_i).to_datetime.beginning_of_day if params[:start].present?) || (@operation.start_date.beginning_of_day if @operation.start_date.present?)
    max = (Time.at(params[:end].to_i).to_datetime.end_of_day if params[:end].present?) || (@operation.end_date.end_of_day if @operation.end_date.present?)
    @events = @operation.filtered(min,max)

    @defmin = @operation.start_date.nil? ? 0 : @operation.start_date.to_i
    @defmax = @operation.end_date.nil? ? 0 : @operation.start_date.to_i

    #@markers = @operation.boundaries.to_json
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

    @wiki = Wiki.new(@operation.name,'Operation ')

    # @combined_operation_data = {
    #   'events' => @new_events,
    #   'article' => @wiki.full_text
    # }

    respond_to do |format|
      format.html
      format.json { render json: @new_events }
      format.js
    end
  end

  def new
    @operation = Operation.new

    respond_to do |format|
      format.html # new.html.erb
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

  def create
    @operation = Operation.new(params[:operation])

    respond_to do |format|
      if @operation.save
        format.html { redirect_to @operation, notice: 'Operation was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
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
        format.js
      else
        format.html { render action: "edit" }
        format.js
      end
    end
  end

  def destroy
    @operation = Operation.find(params[:id])
    @operation.destroy

    respond_to do |format|
      format.html { redirect_to operations_url }
      format.js
    end
  end
end
