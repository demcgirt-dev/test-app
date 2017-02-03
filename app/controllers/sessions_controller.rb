class SessionsController < ApplicationController
  def new
    redirect_to articles_path if logged_in?
  end
  
  # ------------------------------------------------------------
  # session action which creates a new user session
  # retrieves user's email & password inputs, authenticates the user
  # ------------------------------------------------------------
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      render plain: session[:user_id].inspect
      #redirect_to user_path(user)
      #render plain: session[:user_id].inspect
    else
      flash.now[:danger] = "Please verify your login information"
      render 'new'
    end
  end
  
  # ------------------------------------------------------------
  # session action which end a user's session
  # when a user logs out, destroy the session
  # ------------------------------------------------------------
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end
end
