require 'rails_helper'

RSpec.describe 'User', type: :feature do
  context 'shows all user names' do
    it 'displays user names' do
      visit users_path
      users = User.all
      users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'displays user photo' do
      visit users_path
      users = User.all
      users.each do |user|
        expect(page).to have_selector("img[src='#{user.photo}']")
      end
    end

    it 'displays shows number of posts of each user' do
      visit users_path
      users = User.all
      users.each do |user|
        expect(page).to have_content("Number of posts: #{user.post_counter}")
      end
    end

    it 'redirects when clicked on a user' do
      visit users_path
      users = User.all
      users.each do |user|
        click_link(user.name)
        expect(page).to have_current_path(user_path(user))
        visit users_path
      end
    end
  end

  context 'show page' do
    it 'shows profile picture' do
      user = User.first
      visit user_path(user)
      expect(page).to have_selector("img[src='#{user.photo}']")
    end

    it 'show user name' do
      user = User.first
      visit user_path(user)
      expect(page).to have_content(user.name)
    end

    it 'show number of posts by the user' do
      user = User.first
      visit user_path(user)
      expect(page).to have_content("Number of posts: #{user.posts_counter}")
    end

    it "shows a button that lets me view all of a user's posts." do
      user = User.first
      visit user_path(user)
      expect(page).to have_selector('a', text: 'See all posts')
    end
  end

  context 'show' do
    it 'show user bio' do
      user = User.first
      visit user_path(user)
      expect(page).to have_content(user.bio.to_s)
    end
    it 'displays the first three posts and a "Show All" button' do
      user = User.first
      posts = user.most_recent_posts
      visit user_path(user)
      first_post = posts[0]
      second_post = posts[1]
      third_post = posts[2]
      if user.posts.any?
        expect(page).to have_content(first_post.title) if first_post
        expect(page).to have_content(second_post.title) if second_post
        expect(page).to have_content(third_post.title) if third_post
        expect(page).to have_selector('a', text: 'See all posts')
      else
        expect(page).to have_content('This user has no post at the moment')
      end
    end
  end

  context 'Clicks' do
    it "redirects me to the user's post  on clicking on a post" do
      user = User.first
      visit user_path(user)
      user.most_recent_posts.each do |post|
        click_link post.title
        expect(page).to have_current_path(user_post_path(user, post))
        visit user_path(user)
      end
    end
    it "redirects me to the user's post clicking on see all posts" do
      user = User.first
      visit user_path(user)
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(user))
    end
  end
end
