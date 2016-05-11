class ArticlesController < ApplicationController
  
  layout 'blog'
   before_action :set_tags
  
  
  def index
    
    set_meta_tags description: '這是文月(Fumitsuki)放置學習筆記跟廢文的地方。Keep calm and eat eight plates!'

    if params[:category]
      @articles = Article.where(category_id: params[:category]).order('created_at DESC')
      @pagetitle = Category.find(params[:category]).name
    elsif  params[:tag]
    @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all.order('created_at DESC')
    end
  end
  
  def show
    @article = Article.find(params[:id])
    @pagetitle = @article.title
    set_meta_tags description:@article.introduction
  end
  
  def set_tags
    @tags = Article.tag_counts_on(:tags)
  end
  
end
