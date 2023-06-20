require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Test post 1', author_id: 1, comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  it 'title should be present' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 270
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be integer' do
    subject.comments_counter = '10.5'
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be integer' do
    subject.likes_counter = '10.2'
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  describe Post, type: :model do
    let!(:user) { User.create(name: 'person', posts_counter: 0) }

    context 'increment_user_posts_counter' do
      it 'should increment the user posts_counter by 1' do
        expect { Post.create(author_id: user.id, title: 'Test post') }
          .to change { user.reload.posts_counter }.by(0)
      end
    end
  end

  it 'returns five most recent comments for post' do
    expect(subject.recent_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
  end
end
