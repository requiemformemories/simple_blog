class ArticlesController < ApplicationController
  
  layout 'blog'
  
  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "The article is saved successfully!"
    else
      render 'article/new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end
