require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  let(:users) { FactoryBot.create_list(:user, 5) }

  before do
    users
    visit users_path
  end

  describe 'User index page' do
    it 'should display correct number of users' do
      expect(page).to have_css('div.user_info', count: 5)
    end

    it 'should display all users photo' do
      users.each do |_user|
        expect(page).to have_css("img[alt='User Photo']")
      end
    end

    it 'should display all user names' do
      users.each do |user|
        expect(page).to have_content(user.name)
      end
    end

    it 'should redirect to user show page' do
      find_all('a', text: users.first.name)[0].click
      expect(page).to have_current_path(user_path(users.first))
    end

    it 'displays all user post count' do
      users.each do |user|
        expect(page).to have_content(user.post_counter)
      end
    end
  end
end
