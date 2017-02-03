class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #these helper methods are available in all of our views
  helper_method :current_user, :logged_in?
  
  # ------------------------------------------------------------
  # helper method which identifies the current user that is logged in
  # sets current user if it doesn't already exist
  # ------------------------------------------------------------
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  # ------------------------------------------------------------
  # helper method to determine whether the current user is logged in
  # performs a boolean conversion
  # ------------------------------------------------------------
  def logged_in?
    !!current_user
  end
  
  # ------------------------------------------------------------
  # helper method that handles an action if a user NOT logged in
  # if NOT logged in, alert user and redirect to login page
  # ------------------------------------------------------------
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform this action"
      redirect_to root_path
    end
  end

end
