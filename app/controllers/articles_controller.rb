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
      flash[:notice] = "投稿に成功しました。"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
    @article = current_user.articles.find(params[:id])
  end
  
  def destroy
    @article = current_user.articles.find(params[:id])
    if @article.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to articles_path
    else
      render :index
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :image)
    end

end
