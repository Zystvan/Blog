class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_params)
#    @post = @comment.post.id
    
    if @comment.save
      redirect_to @comment
#      redirect_to post_url(@post), :notice => 'Your comment was created!'
    else
      render 'new'
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
    redirect_to post_url(@comment.post_id)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end