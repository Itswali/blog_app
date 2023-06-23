require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:author) { User.create(name: 'person', posts_counter: 0) }
  let!(:post) { Post.create(author_id: author.id, title: 'title', comments_counter: 0, likes_counter: 0) }

  context 'increment_post_likes_counter' do
    it 'should increment likes_counter by one' do
      expect { Like.create(user_id: author.id, post_id: post.id) }
        .to change { post.reload.likes_counter }.by(1)
    end
  end
end
