class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  #before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    
    if logged_in?
      flash[:success] = "Please log out as current user before creating a new one."
      redirect_to articles_path
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Thank you for signing up. Welcome #{@user.username}!"
      redirect_to articles_path
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "You have successfully updated your account."
      redirect_to articles_path
    else
      render :edit
    end
  end
  
  def show
  
  end
  
  def destroy
    if current_user == @user
      session[:user_id] = nil
      @user.destroy
      flash[:notice] = "You have successfully deleted your account"
      redirect_to login_path
    else
      @user.destroy
      flash[:notice] = "User was successfully deleted"
      redirect_to users_path
    end
  end
  
  private
  
  def user_params
    accessible = [:username, :email, :password]
    params.require(:user).permit(accessible)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  # def require_same_user
  #   if current_user != @user
  #     flash[:danger] = "You can only manage your own user account"
  #     redirect_to articles_path
  #   end
  # end
  
end