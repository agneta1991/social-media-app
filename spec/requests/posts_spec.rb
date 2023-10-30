require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'Agneta', id: 1) }
  let(:user_url) { user_url(user) }

  def create_post(author)
    Post.create(
      title: 'My first post',
      text: 'This is my very first post',
      author: author
    )
  end

  describe 'GET /index' do
    before do
      user_post = create_post(user)
      get user_post_path(user, user_post)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('posts/show')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('<h1>Here is a post for given user</h1>')
    end
  end

  describe 'GET /show' do
    before do
      user_post = create_post(user)
      get user_post_path(user, user_post)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('posts/show')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('<h1>Here is a post for given user</h1>')
    end
  end
end
