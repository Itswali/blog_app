require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Osvaldo',
      bio: 'Aspiring FullStack Dev',
      photo: 'https://unsplash.com/photos/iR3dtvKmwAw',
      posts_counter: 2
    )

    @post = Post.create(
      title: 'Test Post',
      text: 'This is a test post',
      comments_counter: 2,
      likes_counter: 5,
      author_id: @user.id
    )

    @comment1 = Comment.create(
      text: 'First comment',
      post_id: @post.id,
      user_id: @user.id
    )

    @comment2 = Comment.create(
      text: 'Second comment',
      post_id: @post.id,
      user_id: @user.id
    )
  end

  describe 'the post show page' do
    it 'displays the post title' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content('This is a test post')
    end

    it 'displays the post author' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content("This is a test post\n#{@user.name}:")
    end

    it 'displays the number of comments' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content('Comments: 4')
    end

    it 'displays the number of likes' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content('Likes: 5')
    end

    it 'displays the post body' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content('This is a test post')
    end

    it 'displays the username of each commentator' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content("This is a test post\n#{@user.name}")
    end

    it 'displays the comment left by each commentator' do
      visit user_post_path(user_id: @user.id, id: @post.id)
      expect(page).to have_content('First comment')
      expect(page).to have_content('Second comment')
    end
  end
end
