class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :authorized?

  before_filter :set_marker_default

  def set_marker_default
    @markers = {}.to_json
  end

  def generate_markers(events)
    markers = events.collect do |event|
      {
        :sidebar => render_to_string(:partial=>"events/event.html.erb", :locals=>{event:event}),
        event_id:event.id,
        name:event.name,
        date:event.event_date.to_i,
        title: event.gmaps4rails_title,
        :description => render_to_string(:partial=>"events/infowindow.html.erb", :locals=>{event:event}),
        lng: event.lng,
        lat: event.lat
      }.merge(event.marker_picture)
    end
    return markers.to_json
  end

  def authorized?
    @current_user ||= User.find_by_id(session[:user_id])
    if @current_user.nil?
      return false
    else
      return true
    end
  end

  def authenticate_user
    unless session[:user_id].present? && User.find(session[:user_id].to_i).present?
      redirect_to login_url, notice: "Please sign in"
    end
  end
end
