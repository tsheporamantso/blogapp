class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params.merge(user_id: current_user.id))

    if @comment.save
      redirect_back_or_default(user_post_comments_path(@user, @post))
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
