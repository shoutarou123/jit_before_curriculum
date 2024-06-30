class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :destory]


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

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "投稿の編集に成功しました"
      redirect_to article_path(@article)
    else
      render :edit
    end
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

    def correct_user
      @article = current_user.articles.find_by(id: params[:id])
      redirect_to articles_path, notice: "この記事を編集する権限がありません" if @article.nil?
    end

end
