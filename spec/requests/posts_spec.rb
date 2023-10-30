require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /show' do
    it 'renders a successful response' do
      user = User.create!(name: 'Agneta', id: 1)
      valid_attributes = { title: 'My first post', text: 'This is my very first post', author: user }
      post = Post.create!(valid_attributes)
      get user_post_path(user, post)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      user = User.create!(name: 'Agneta', id: 1)
      valid_attributes = { title: 'My first post', text: 'This is my very first post', author_id: user.id }

      post = Post.create!(valid_attributes)
      get user_post_path(user, post)
      expect(response).to render_template('posts/show')
    end

    it 'includes correct placeholder text in the response body' do
      user = User.create!(name: 'Agneta', id: 1)
      valid_attributes = { title: 'My first post', text: 'This is my very first post', author_id: user.id }

      post = Post.create!(valid_attributes)
      get user_post_path(user, post)
      expect(response.body).to include('<h1>Here is a post for given user</h1>')
    end
  end
end
