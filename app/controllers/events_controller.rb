class EventsController < ApplicationController

  def index
    @events = Event.order(:event_date).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def show
    @event = Event.find(params[:id])
    @markers = @event.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  def new
    @event = Event.new
    @markers = [{}].to_json
    respond_to do |format|
      format.html
      format.json { render json: @event }
    end
  end

  def edit
    @controller = params[:controller]
    @action = params[:action]
    @event = Event.find(params[:id])
    @markers = @event.to_gmaps4rails
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.create(params[:event])
    if @event.operation.active == false
      @event.update_attributes(active:true)
    end
    @markers = @event.to_gmaps4rails
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    if params[:event][:address].nil?
      params[:event][:address] = nil
    end
    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
