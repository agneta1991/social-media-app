class LikesController < ApplicationController
  def new
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def create
    @post = Post.find(params[:id])
    @like = @post.likes.new
    @like.author = current_user

    if @like.save
      redirect_to user_post_path(@post.author, @post)
    else
      render :new
    end
  end
end
