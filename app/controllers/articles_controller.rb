class ArticlesController < ApplicationController

  def index
    @article  = Article.all.order('updated_at DESC')
  end
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "article was successfully created"
      # redirect_to article_path(@article)
      redirect_to articles_url
    else
      render 'new'
    end
  end
 
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  def show
      @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end
