class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = '新規投稿に成功しました。'
      redirect_to user_path(@article.user_id)
    else
      flash[:danger] = "新規投稿に失敗しました: #{@article.errors.full_messages.join(', ')}"
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :content, :image)
    end

end
