class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts, foreign_key: :author_id


  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
