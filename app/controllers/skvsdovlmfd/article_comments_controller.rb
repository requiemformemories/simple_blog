class Skvsdovlmfd::ArticleCommentsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "0000"
  before_action :set_article 
  
  layout 'backend'
  
  def edit
    @comment = @article.comments.find(params[:id])
  end
  
  def update
    @comment = @article.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to skvsdovlmfd_article_path(@article)
  end
  
  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to skvsdovlmfd_article_path(@article)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:reply)
  end
  
  def set_article
     @article = Article.find(params[:article_id])
  end
end
