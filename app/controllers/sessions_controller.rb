class SessionsController < ApplicationController
  def new
    @markers = [{}].to_json
  end

  def create
    user = User.find_by_username(params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      render "new", notice:"Authentication failure"
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
