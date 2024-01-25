class Api::UsersController < ApplicationController
  def posts
    @posts = User.find(params[:id]).posts
    render json: { posts: @posts }
  end
end
