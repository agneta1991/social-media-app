class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validate :validation_posts_counter

  after_initialize :initialize_post_counter

  def most_recent_post(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  def admin
    role == "admin"
  end

  private

  def validation_posts_counter
    return unless post_counter.present? && (!post_counter.is_a?(Integer) || post_counter.negative?)

    errors.add(:post_counter, 'It must be a number greater than or equal to zero') unless post_counter.zero?
  end

  def initialize_post_counter
    self.post_counter ||= 0
  end
end
