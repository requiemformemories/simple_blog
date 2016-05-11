class Skvsdovlmfd::ArticleCommentsController < Skvsdovlmfd::ApplicationController
  before_action :set_article 
  
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
