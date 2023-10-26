class Comment < ApplicationRecord
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  after_save :update_comment_counter

  def update_comment_counter
    post.update(comments_counter: post.comments.count)
  end
end
