class EventTypesController < ApplicationController
  def index
    @event_types = EventType.all
  end

  def show
  end

  def edit
    @event_type = EventType.find(params[:id])
  end

  def update
    @event_type = EventType.find(params[:id])
    if @event_type.update_attributes(params[:event_type])
      redirect_to event_types_path
    else
      render 'edit'
    end
  end

  def create
    if EventType.create([params[:event_type]])
      redirect_to event_types_path
    else
      render 'new'
    end
  end

  def new
    @event_type = EventType.new
  end

  def destroy
    @event_type = EventType.find(params[:id])
    if @event_type.destroy
      redirect_to event_types_path
    else
      redirect_to :back
    end
  end
end
