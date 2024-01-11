FactoryBot.define do
  factory :comment do
    text { 'Happy coding, and trust you having a wonderful day' }
    association :user
    association :post
  end
end
