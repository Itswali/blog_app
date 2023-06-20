require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:author) { User.create(name: 'person', posts_counter: 0) }
  let!(:post) { Post.create(author_id: author.id, title: 'title', comments_counter: 0, likes_counter: 0) }

  context 'update_comments_counter' do
    it 'should increment comments_counter by one' do
      expect { Comment.create(author_id: author.id, post_id: post.id) }
        .to change { post.reload.comments_counter }.by(0)
    end
  end
end
