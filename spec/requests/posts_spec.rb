require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    let(:user) { create(:user) }

    it 'returns a success response' do
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }
    let(:post) { create(:post, author: user) }

    it 'returns a success response' do
      get user_post_path(user, post)
      expect(response).to have_http_status(:success)
    end

    it 'renders the correct template' do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
    end
  end
end
