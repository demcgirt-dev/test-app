class UsersController < ApplicationController
  
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
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You have successfully updated your account."
      redirect_to articles_path
    else
      render :edit
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    accessible = [:username, :email, :password]
    params.require(:user).permit(accessible)
  end
  
end