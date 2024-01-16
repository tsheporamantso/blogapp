require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it "returns a successful response" do
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it "renders a correct tamplate" do
      get users_path
      expect(response).to render_template(:index)
    end

    it "includes correct placeholder text" do
      get users_path
      expect(response.body).to include("Welcome to user index page!")
    end
  end
end
