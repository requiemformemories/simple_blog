class Admin::ArticlesController < Admin::ApplicationController

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
      flash[:error] = @comment.errors.full_messages.join(". ")
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
      flash[:alert] = @article.errors.full_messages.join(". ")
      render :action => :edit
    end
  end
  
  def destroy
     @article = Article.find(params[:id])
     @article.destroy
     redirect_to skvsdovlmfd_articles_path
  end
  
  private
  def article_params
    params.require(:article).permit(:title, :text, :category_id, :introduction, :slug, :tag_list, :picture)
  end
  
end
