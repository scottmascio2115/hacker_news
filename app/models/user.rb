class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password
  
  has_many :posts
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post
end
