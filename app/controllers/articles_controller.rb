class ArticlesController < ApplicationController

  before_filter :require_login, only: [:new, :create, :update, :destroy]
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    @article.author = current_user
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(articles_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  def destroy
    if logged_in? || current_user == @article.author
      @article = Article.find(params[:id])
      @article.destroy
      flash.notice = "Article '#{@article.title}' Destroyed!"
      redirect_to articles_path
    end
  end

end
