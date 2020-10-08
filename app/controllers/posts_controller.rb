class PostsController < ApplicationController
  def index
    @posts = Post.order('updated_at DESC')
  end
  
  def new
    @post = Post.new
  end
  
  def create
    Post.create(post_params)
    redirect_to action: :index
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    post = Post.find(params[:id])
    if post.user_id == current_user.id
     post.update(post_params)
    end
    redirect_to action: :index
  end
  
  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
     post.destroy
    end
    redirect_to action: :index
  end
  
  private
  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end
  
  
end
