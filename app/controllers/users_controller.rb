class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :show]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
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
  
  private
  
  def user_params
    accessible = [:username, :email, :password]
    params.require(:user).permit(accessible)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end