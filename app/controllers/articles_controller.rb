class ArticlesController < ApplicationController
  
  layout 'blog'
  
  def index
    if params[:category]
      @articles = Article.where(category_id: params[:category]).order('created_at DESC')
      @pagetitle = Category.find(params[:category]).name
    else
      @articles = Article.all.order('created_at DESC')
    end
  end
  
  def show
    @article = Article.find(params[:id])
    @pagetitle = @article.title
  end
  

  
end
