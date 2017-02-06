class CategoriesController < ApplicationController
  
  before_action :set_category, except: [:create, :new, :index]
  before_action :require_admin, except: [:index, :show]
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def edit
  end
  
  def update
    if @category.valid? && @category.update(category_params)
      flash[:success] = "Category was successfully updated."
      redirect_to category_path(@category)
    else
      render :edit
    end
  end
  
  def create
    @category = Category.new(category_params)
    
    if @category.valid? && @category.save
      flash[:success] = "Category was successfully created."
      redirect_to categories_path
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category name was successfully updated"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end
  
  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles
  end
  
  private
    def set_category
      @category = Category.find(params[:id])
    end
    
    def category_params
      params.require(:category).permit(:name)
    end
    
    def require_admin
      if !logged_in? || (logged_in? && !current_user.admin?)
        flash[:danger] = "Only administrators can perform this action."
        redirect_to categories_path
      end
    end
  
end