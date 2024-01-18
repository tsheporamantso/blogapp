class CommentsController < ApplicationController
  before_action :set_user_and_post, only: [:new, :create]

  def new
    store_referer
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

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end

  def store_referer
    session[:referer] = request.referer
  end

  def redirect_back_or_default(default)
    redirect_to(session[:referer] || default )
    session.delete(:referer)
  end
end
