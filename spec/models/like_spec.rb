require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_likes_counter' do
    it 'updates post likes_counter after save' do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, author: user)

      expect(post.likes_counter).to eq(0)

      FactoryBot.create(:like, user:, post:)
      post.reload

      expect(post.likes_counter).to eq(1)
    end
  end
end
