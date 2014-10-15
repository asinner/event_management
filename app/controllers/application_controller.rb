class ApplicationController < ActionController::Base
  # Authorization
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def authenticate_user!
    redirect_to new_user_session_path, notice: 'You must be signed in to perform that action' unless current_user
  end
  
  helper_method :authenticate_user!

  def user_not_authorized
    redirect_to events_url, notice: 'You are not authorized to perform that action'
  end
end
