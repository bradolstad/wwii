class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :authorized?

  before_filter :set_marker_default

  def set_marker_default
    @markers = {}.to_json
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
