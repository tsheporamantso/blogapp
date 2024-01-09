class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts, foreign_key: :author_id
end