class ArticlesController < ApplicationController

  def index
    @articles = Article.new
  end

end
