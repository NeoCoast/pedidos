class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  stale_when_importmap_changes

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def require_user
    unless current_user
      redirect_to root_path, alert: "Por favor selecciona un usuario primero."
    end
  end
end
