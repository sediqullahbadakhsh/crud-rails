class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  def article_params
    params.require(:article).permit(:title, :description)
  end
  def create
    @article = Article.new(article_params)
    @article.save
   
  end
  private
end
