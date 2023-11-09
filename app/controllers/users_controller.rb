class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |format|
      # format.html
      format.xml  { render :xml => @users }
      format.json { render :json => @users }
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(author_id: @user.id)
  end
end
