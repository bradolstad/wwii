class EventsController < ApplicationController

  before_filter :authenticate_user, except:[:show]

  def index
    @events = Event.order(:event_date).page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @event = Event.find(params[:id])
    @markers = @event.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @event = Event.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @controller = params[:controller]
    @action = params[:action]
    @event = Event.find(params[:id])
    @markers = @event.to_gmaps4rails
  end

  def create
    @event = Event.create(params[:event])
    if @event.operation.active == false
      @event.update_attributes(active:true)
    end
    @markers = @event.to_gmaps4rails
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render action: "new" }
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
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
    end
  end
end
