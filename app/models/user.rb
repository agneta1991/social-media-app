class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validate :validation_posts_counter

  def most_recent_post(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  private

  def validation_posts_counter
    return unless posts_counter.present? && (!posts_counter.is_a?(Integer) || posts_counter <= 0)

    errors.add(:posts_counter, 'It must be a number greater than or equal to zero')
  end
end
