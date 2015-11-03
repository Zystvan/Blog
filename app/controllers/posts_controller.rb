class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(:post => @post)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to post_url(@post), :notice => 'Your post was created!'
    else
      render 'new'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    
    if @post.update_attributes(post_params)
      redirect_to post_url(@post), :notice => 'Post edited successfully!'
    else
      render 'edit'
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:content)
    end
end