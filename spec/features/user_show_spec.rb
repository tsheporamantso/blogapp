require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:posts) { FactoryBot.create_list(:post, 5, author: user) }

  before do
    posts
    visit user_path(user)
  end

  describe 'User show page' do
    it 'displays user photo' do
      expect(page).to have_css("img[alt='User Photo']")
    end
  end
end