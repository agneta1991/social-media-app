class CommentsController < ApplicationController
  before_action :load_post

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    render json: @comments, except: %i[created_at updated_at]
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params.merge(author: current_user))
    if @comment.save
      render json: @comment, status: :created, location: user_post_comment_path(current_user, @post, @comment)
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to user_posts_path(current_user), notice: 'Comments was successfully deleted.'
  end

  private

  def load_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
