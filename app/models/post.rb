class Post < ApplicationRecord
  belongs_to :user
  has_many :comments 
  
  def user_comment(user_id)
    Comment.find_by(user_id: user_id, post_id: id)
  end
  
end
