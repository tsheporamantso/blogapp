require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }
  
  context 'Post attributes to be present' do
    it 'should not be valid without a title' do
      post = FactoryBot.build(:post, title: nil, author: user)
      expect(post).to_not be_valid
    end

    it 'title should not be too long' do
      post = FactoryBot.build(:post, title: "a" * 251, author: user)
      expect(post).to_not be_valid
    end
  end

  context 'comments_counter should only be numerical, greater_than or equal 0' do
    it 'should only take integer values' do
      post = FactoryBot.build( :post, comments_counter: "a", author: user)
      expect(post).to_not be_valid
    end

    it 'should not be valid with a negative comment_counter' do
      post = FactoryBot.build(:post, comments_counter: -1, author: user)
      expect(post).to_not be_valid
    end

    it 'should be valid with non-negative comments_counter value' do
      post = FactoryBot.build(:post, comments_counter: 1, author: user)
      expect(post).to be_valid
    end
  end
end
