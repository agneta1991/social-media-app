class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_post_counter

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validate :validation_comments_counter

  def update_post_counter
    author.update(post_counter: author.posts.count)
  end

  def most_recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def validation_comments_counter
    return unless comments_counter.present? && (!comments_counter.is_a?(Integer) || comments_counter <= 0)

    errors.add(:comments_counter, 'It must be a number greater than or equal to zero')
  end
end
