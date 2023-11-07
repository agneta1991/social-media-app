require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }
  context 'index page' do
    it "show user's username" do
      visit user_posts_path(user)
      expect(page).to have_content(user.name)
    end
    it "shows user's profile picture" do
      visit user_posts_path(user)
      expect(page).to have_selector("img[src='#{user.photo}']")
    end
    it 'shows the number of posts for each user' do
      visit user_posts_path(user)
      expect(page).to have_content("Number of posts: #{user.post_counter}")
    end
    it "shows a post's title" do
      visit user_posts_path(user)
      first_recent_post = user.most_recent_post[0]
      expect(page).to have_content(first_recent_post.title) if first_recent_post
    end
    it "shows some of the post's body." do
      visit user_posts_path(user)
      first_recent_post = user.most_recent_post[0]
      if first_recent_post
        if first_recent_post.text.length > 200
          expect(page).to have_content("#{first_recent_post.text[0, 200]}...")
        else
          expect(page).to have_content(first_recent_post.text)
        end
      end
    end
  end
  context 'index' do
    it "shows some of the post's body." do
      visit user_posts_path(user)
      first_recent_post = user.most_recent_post[0]
      if first_recent_post
        if first_recent_post.text.length > 200
          expect(page).to have_content("#{first_recent_post.text[0, 200]}...")
        else
          expect(page).to have_content(first_recent_post.text)
        end
      end
    end
    it 'shows how many comments a post has.' do
      visit user_posts_path(user)
      first_recent_post = user.most_recent_post[0]
      expect(page).to have_content("Comments: #{first_recent_post.comments_counter}") if first_recent_post
    end
    it 'shows how many likes a post has.' do
      visit user_posts_path(user)
      first_recent_post = user.most_recent_post[0]
      expect(page).to have_content("Likes: #{first_recent_post.likes_counter}") if first_recent_post
    end
    it 'shows a section for pagination ' do
      visit user_posts_path(user)
      expect(page).to have_button('Pagination')
    end
  end
  context 'Click' do
    it "redirects me to that post's show page when I click on a post" do
      visit user_posts_path(user)
      if user.posts.any?
        first_recent_post = user.most_recent_post[0]
        click_link first_recent_post.title
        expect(page).to have_current_path(user_post_path(user, first_recent_post))
      end
    end
  end
end
