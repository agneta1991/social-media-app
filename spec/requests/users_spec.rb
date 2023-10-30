require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { User.create(name: 'Agneta', id: 1) }

  describe 'GET /index' do
    before { get users_url }

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('users/index')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('<h1>Here is a list of users</h1>')
    end
  end

  describe 'GET /show' do
    before { get user_url(user) }

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template('users/show')
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include("<h1>#{user.name}</h1>")
    end
  end
end
