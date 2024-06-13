class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:success] = '新規投稿に成功しました。'
      redirect_to root_path
    else
      flash[:danger] = '新規投稿に失敗しました。'
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :content)
    end

end
