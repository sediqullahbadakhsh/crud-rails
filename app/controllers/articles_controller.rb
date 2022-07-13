class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path(@article)
      flash[:notice] = "article was successfully created"
    else
      render 'new'
  end
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
