require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  let(:user) { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }
  context 'show page' do
    it "shows the post's title" do
      if user.posts.any?
        first_recent_post = user.most_recent_post[0]
        visit user_post_path(user, first_recent_post)
        expect(page).to have_content(first_recent_post.title)
      end
    end
    it "shows the post's author" do
      if user.posts.any?
        first_recent_post = user.most_recent_post[0]
        visit user_post_path(user, first_recent_post)
        expect(page).to have_content(first_recent_post.author.name)
      end
    end
    it 'shows how many likes the post has.' do
      if user.posts.any?
        first_recent_post = user.most_recent_post[0]
        visit user_post_path(user, first_recent_post)
        expect(page).to have_content("Likes: #{first_recent_post.likes_counter}")
      end
    end
    it 'shows how many comments the post has.' do
      if user.posts.any?
        first_recent_post = user.most_recent_post[0]
        visit user_post_path(user, first_recent_post)
        expect(page).to have_content("Comments: #{first_recent_post.comments_counter}")
      end
    end
  end
  context 'show page' do
    it 'shows how the post body.' do
      if user.posts.any?
        first_recent_post = user.most_recent_post[0]
        visit user_post_path(user, first_recent_post)
        expect(page).to have_content(first_recent_post.text)
      end
    end
    it 'shows how the username of each commentor' do
      if user.posts.any?
        first_recent_post = user.most_recent_post[0]
        visit user_post_path(user, first_recent_post)
        if first_recent_post.comments.any?
          first_recent_post.comments.each do |comment|
            expect(page).to have_content(comment.user.name)
          end
        end
      end
    end
    it 'shows the comment each commentor left.' do
      if user.posts.any?
        first_recent_post = user.most_recent_post[0]
        visit user_post_path(user, first_recent_post)
        if first_recent_post.comments.any?
          first_recent_post.comments.each do |comment|
            expect(page).to have_content(comment.text)
          end
        end
      end
    end
  end
end
