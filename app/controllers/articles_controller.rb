class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  # ------------------------------------------------------------
  # Index action which lists all of the articles via the  
  # index.html.erb template, using the instance variable
  # ------------------------------------------------------------
  def index
    @articles = Article.all
  end
  
  # ------------------------------------------------------------
  # Handles the new action using the instance variable from the 
  # new.html.erb template form
  # ------------------------------------------------------------
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  # ------------------------------------------------------------
  # Handles the update action & redirects back to the show path
  # ------------------------------------------------------------
  def update
    if 
      @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end
  
  # ------------------------------------------------------------
  # Handles the create action & redirects back to the show path
  # ------------------------------------------------------------
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  # ------------------------------------------------------------
  # Handles the destroy action & deletes data from the table
  # ------------------------------------------------------------
  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  private
    def set_article
      @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end