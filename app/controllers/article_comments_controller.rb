class ArticleCommentsController < ApplicationController
  before_action :set_article 
  
  def create
    @comment = @article.comments.create(comment_params)
    if @comment.save
      flash[:message] = "The comment is saved successfully!"
      redirect_to article_path(@article)
    else
      flash[:error] = @comment.errors.full_messages.join(". ")
      redirect_to(@comment.article)
    end
  end

  
  private
  def comment_params
    params.require(:comment).permit(:name, :text, :email)
  end
  
  def set_article
     @article = Article.find(params[:article_id])
  end
  
end

