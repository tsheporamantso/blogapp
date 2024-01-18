class PostsController < ApplicationController
  before_action :set_posts, only: %i[index show]

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(current_user)
    else
      render :new, status: :unprocessable_entity
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_posts
    @user = User.find(params[:user_id])
  end
end
