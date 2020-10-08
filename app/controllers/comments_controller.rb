class CommentsController < ApplicationController
  def index
    post_ids = Comment.group(:post_id).order('count_post_id DESC').count(:post_id).keys
    @posts = post_ids.map { |post_id| Post.find(post_id) }
  end
  
  def create
    @comment = Comment.create(text: create_params[:text], post_id: create_params[:post_id], user_id: current_user.id)
    redirect_to "/posts/#{@comment.post.id}"
  end
  
  private
  def create_params
    params.permit(:text, :post_id)
  end
  
end
