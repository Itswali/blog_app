class Like < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
