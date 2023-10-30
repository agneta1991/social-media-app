require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /show' do
    it 'renders a successful response' do
      valid_attributes = { name: 'Agneta', id: 1 }

      user = User.create!(valid_attributes)
      get user_url(user)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      valid_attributes = { name: 'Agneta', id: 1 }
      user = User.create!(valid_attributes)
      get user_url(user)
      expect(response).to render_template('users/show')
    end

    it 'includes correct placeholder text in the response body' do
      valid_attributes = { name: 'Agneta', id: 1 }
      user = User.create!(valid_attributes)
      get user_url(user)
      expect(response.body).to include('<h1>Agneta</h1>')
    end
  end
end
