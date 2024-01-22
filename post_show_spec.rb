require 'rails_helper'

RSpec.describe 'Post show page' do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) }
  let(:comments) { FactoryBot.create_list(:comment, 5, author: user, post:) }

  before do
    post.reload

    FactoryBot.create_list(:comment, 5, post:)

    visit user_post_path(user, post)
  end

  describe 'Post show page' do
    it 'displays post title' do
      expect(page).to have_content(post.title)
    end

    it
  end
end
