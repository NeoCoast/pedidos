class SessionsController < ApplicationController
  def create
    session[:current_user_id] = params[:user_id]
    redirect_back fallback_location: root_path
  end
end
