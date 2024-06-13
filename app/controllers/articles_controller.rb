class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:id])
    if @article.save
    flash[:success] = '新規投稿に成功しました。'
    redirect_to article_url(@article)
    else
    flash[:danger] = '新規投稿に失敗しました。'
    render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end
  
end
