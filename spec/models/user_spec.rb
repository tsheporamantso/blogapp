require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a name' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).to_not be_valid
  end

  it 'should only take integer values' do
    user = FactoryBot.build(:user, post_counter: "a")
    expect(user).to_not be_valid
  end

  it 'should not be valid with negative post_counter' do
    user = FactoryBot.build(:user, post_counter: -1)
    expect(user).to_not be_valid
  end

  it 'should be valid with non-negative post_counter' do
    user = FactoryBot.build(:user, post_counter: 1)
    expect(user).to be_valid
  end
end
