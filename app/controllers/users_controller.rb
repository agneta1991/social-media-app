class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(author_id: @user.id)
  end
end
