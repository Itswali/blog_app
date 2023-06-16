class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
