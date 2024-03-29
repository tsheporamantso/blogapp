class Api::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def comments
    @post = Post.find(params[:id])
    render json: { comments: @post.comments }
  end

  def add_comment
    @post = Post.find(params[:id])
    comment_text = params[:text]
    @comment = @post.comments.build(text: comment_text)
    @comment.author = current_user

    if @comment.save
      render json: { message: 'Comment added successfully' }, status: :created
    else
      render json: { error: 'Failed to add comment' }, status: :unprocessable_entity
    end
  end
end
