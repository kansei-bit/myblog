class ArticlesController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
      @article = Article.new
    else
      redirect_to root_path
    end
  end

  def create
    binding.pry
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :content).merge(user_id: current_user.id)
  end
end
