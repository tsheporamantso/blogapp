class PostsController < ApplicationController
  before_action :set_users, only: %i[index show new]

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
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:success] = 'Post was Successfully created'
      redirect_to user_posts_path(current_user)
    else
      flash[:error] = 'Error: post could not be saved'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_users
    @user = User.find(params[:user_id])
  end
end
