class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  def most_recent_post(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
