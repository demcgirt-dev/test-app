class WelcomeController < ApplicationController
  
  # ------------------------------------------------------------
  # if user is already logged in, redirect to the articles page
  # ------------------------------------------------------------
  def home
    redirect_to articles_path if logged_in?
  end 
  
  def about
    
  end
  
end