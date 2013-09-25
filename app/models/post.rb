class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :comments
end
