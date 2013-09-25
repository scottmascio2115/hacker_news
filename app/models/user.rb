class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password
  
  has_many :posts
  has_many :comments

end
