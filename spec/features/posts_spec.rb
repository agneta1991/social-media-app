require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  user = User.first
  post = Post.first

  #   Tests for User post index page:

  it 'shows user profile picture' do
    visit user_posts_path(user)
    expect(page).to have_selector("img[src='#{user.photo}']")
  end

  it 'shows usr name' do
    visit user_posts_path(user)
    expect(page).to have_content(user.name)
  end

  it 'displays number of posts of the user' do
    visit user_posts_path(user)
    expect(page).to have_content("Number of posts: #{user.post_counter}")
  end

  it 'displays post title' do
    visit user_posts_path(user)
    expect(page).to have_content(post.title)
  end

  it 'displays post body' do
    visit user_posts_path(user)
    expect(page).to have_content("#{post.text[0, 127]}...") if post.text.length > 130
  end

  it 'displays the first comment' do
    visit user_posts_path(user)
    first_comment = post.most_recent_comments.first
    expect(page).to have_content("#{first_comment.author.name}: #{first_comment.text}")
  end

  it 'displays number of comments of each post' do
    visit user_posts_path(user)
    expect(page).to have_content("Comments: #{post.comments_counter}")
  end

  it 'displays number of likes of each post' do
    visit user_posts_path(user)
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  it 'has a button to display all posts' do
    visit user_posts_path(user)
    expect(page).to have_button('Pagination')
  end

  it 'redirects when clicked on a post title' do
    visit user_posts_path(user)
    click_link(post.title)
    expect(page).to have_current_path(user_post_path(user, post))
  end

  #   Tests for User post show page:

  it 'displays post title' do
    visit user_post_path(user, post)
    expect(page).to have_content(post.title)
  end

  it 'displays who wrote the post' do
    visit user_post_path(user, post)
    expect(page).to have_content(user.name)
  end

  it 'displays number of comments of the post' do
    visit user_post_path(user, post)
    expect(page).to have_content("Comments: #{post.comments_counter}")
  end

  it 'displays number of likes of the post' do
    visit user_post_path(user, post)
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  it 'displays post body' do
    visit user_post_path(user, post)
    expect(page).to have_content(post.text)
  end

  it 'displays the name of the commenter' do
    visit user_post_path(user, post)
    post.comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end

  it 'displays the body of the comment' do
    visit user_post_path(user, post)
    post.comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
