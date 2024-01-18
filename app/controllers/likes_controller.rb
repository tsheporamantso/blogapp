class LikesController < ApplicationController
  before_action :set_user_and_post, only: [:new, :create]
  
  def new
    @like = Like.new
  end

  def create
  end

  private

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end
end
