require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text' do
      get users_path
      expect(response.body).to include('Welcome to user index page!')
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    it 'returns a successful response' do
      get user_path(user)
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'includes the correct placeholder text' do
      get user_path(user)
      expect(response.body).to include('Welcome to user show page!')
    end
  end
end
