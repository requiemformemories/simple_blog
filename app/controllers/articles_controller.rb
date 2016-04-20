class ArticlesController < ApplicationController
  
  layout 'blog'
  
  def index
    @articles = Article.all.order('created_at DESC')
  end
  
  def show
    @article = Article.find(params[:id])
  end
  

  
end
