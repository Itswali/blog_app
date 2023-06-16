class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_posts_counter
    author.update(posts_counter: posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
