class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user
    if @post.save
      redirect_to user_posts_path
    else
      render :new, locals: { post: @post }
    end
  end
end
