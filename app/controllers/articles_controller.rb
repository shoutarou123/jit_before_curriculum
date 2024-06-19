class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to article_path(current_user), notice: "投稿成功"
    else
      Rails.logger.debug @article.errors.full_messages
      render :new
    end
  end

  def show
    @article = current_user.articles.find(params[:id])
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :content, :image)
    end

end
