class PostsController < ApplicationController
  before_action :set_posts, only: [:index, :show]

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  private

  def set_posts 
    @user = User.find(params[:user_id])
  end
end
