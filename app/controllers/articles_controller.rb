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
      flash[:success] = "投稿に成功しました。"
      debugger
      redirect_to article_path(@article)
    else
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
