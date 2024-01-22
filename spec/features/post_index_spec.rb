require 'rails_helper'

RSpec.describe 'Post Index page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) }
  let(:comments) { FactoryBot.create_list(:comment, 3, post:, text: 'old', author: user, created_at: 4.days.ago) }
  let(:recent_comments) { FactoryBot.create_list(:comment, 5, post:, text: 'new', author: user) }

  before do
    post
    comments
    recent_comments
    visit user_posts_path(user)
  end

  describe 'user section in user post index' do
    it 'shows user name' do
      expect(page).to have_content(user.name)
    end

    it 'display user photo' do
      expect(page).to have_css("img[alt='User Photo']")
    end

    it 'display user post count' do
      expect(page).to have_content(user.post_counter)
    end

    it 'shows how many likes post has' do
      expect(page).to have_content(post.likes_counter)
    end
  end
    
  describe 'Posts section in user posts index' do
    it 'Shows post heading' do
      expect(page).to have_content('Post')
    end

    it 'Shows post title' do
      expect(page).to have_content(post.title)
    end

    it 'Shows post content' do
      expect(page).to have_content(post.text)
    end

    it 'Shows pagination section if there are more posts than fit on the view' do
      FactoryBot.create_list(:post, 10, author: user)
      visit user_posts_path(user)
      expect(page).to have_link('Pagination',href: user_posts_path(user))
    end

    it 'redirects to post show page' do
      click_link(post.title)
      expect(page).to have_current_path(user_post_path(user, post))
    end
  end

  describe 'Comments section in user post index' do
    it 'Shows comment heading' do
      expect(page).to have_content('Comments:')
    end

    it 'Shows comments count' do
      expect(page).to have_content(post.comments_counter)
    end

    it 'Show five most recent comments' do
      recent_comments.reverse.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end

