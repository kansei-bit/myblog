class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_the_article, only: [:show, :edit, :update, :destroy]
  before_action :writer?, only: [:edit, :destroy]

  def index
    @articles = Article.order("created_at DESC")
  end

  def new
      @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end

  def find_the_article
    @article = Article.find(params[:id])
  end

  def writer?
    unless current_user.id == @article.user.id
      redirect_to root_path
    end
  end
end
