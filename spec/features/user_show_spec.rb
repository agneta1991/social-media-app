require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let(:user) { User.create(name: 'Rose', photo: 'https://unsplash.com/photos/F_-0000BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(author: user, title: 'Hey', text: 'This is my post') }

  context 'show page' do
    it 'shows profile picture' do
      visit user_path(user)
      expect(page).to have_selector("img[src='#{user.photo}']")
    end

    it 'show user name' do
      visit user_path(user)
      expect(page).to have_content(user.name)
    end

    it 'show number of posts by the user' do
      visit user_path(user)
      expect(page).to have_content("Number of posts: #{user.post_counter}")
    end

    it "shows a button that lets me view all of a user's posts." do
      visit user_path(user)
      expect(page).to have_selector('a', text: 'See All Posts')
    end
  end

  context 'show' do
    it 'show user bio' do
      visit user_path(user)
      expect(page).to have_content(user.bio.to_s)
    end
    it 'displays the first three posts and a "Show All" button' do
      posts = user.most_recent_post
      visit user_path(user)
      first_post = posts[0]
      second_post = posts[1]
      third_post = posts[2]
      if user.posts.any?
        expect(page).to have_content(first_post.title) if first_post
        expect(page).to have_content(second_post.title) if second_post
        expect(page).to have_content(third_post.title) if third_post
        expect(page).to have_selector('a', text: 'See All Posts')
      end
    end
  end

  context 'Clicks' do
    it "redirects me to that post's show page when I click on a post" do
      visit user_posts_path(user)
      if user.posts.any?
        first_recent_post = user.most_recent_post[0]
        click_link first_recent_post.title
        expect(page).to have_current_path(user_post_path(user, first_recent_post))
      end
    end

    it "redirects me to the user's post clicking on see all posts" do
      visit user_path(user)
      click_link 'See All Posts'
      expect(page).to have_current_path(user_posts_path(user))
    end
  end
end
