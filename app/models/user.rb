class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id

  def most_recent_post(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
