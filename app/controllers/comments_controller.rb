class CommentsController < ApplicationController
  before_action :set_user_and_post, only: %i[new create]
  load_and_authorize_resource

  def new
    store_referer
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params.merge(author_id: current_user.id))

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_back_or_default(user_post_comments_path(@user, @post))
    else
      flash[:error] = 'Error: Comment could not be saved'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if @comment.destroy
      flash[:notice] = 'Comment deleted successfully'
    else
      flash[:error] = 'Error: Comment could not be deleted'
    end

    redirect_back_or_default(root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_user_and_post
    @user = User.includes(posts: :comments).find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:post_id])
  end

  def store_referer
    session[:referer] = request.referer
  end

  def redirect_back_or_default(default)
    redirect_to(session[:referer] || default)
    session.delete(:referer)
  end
end
