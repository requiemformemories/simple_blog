class Skvsdovlmfd::ArticlesController < ApplicationController
  
  layout 'blog'
  
  def index
    @articles = Article.all.order('created_at DESC')
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new()
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "The article is saved successfully!"
      redirect_to skvsdovlmfd_article_path(@article)
    else
      render :action => :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "The article is updated successfully!"
      redirect_to skvsdovlmfd_article_path(@article)
    else
      render :action => :edit
    end
  end
  
  def destroy
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
  
end
