FactoryBot.define do
  factory :comment do
    text { 'Happy coding, and trust you having a wonderful day' }
    association :author, factory: :user
    association :post, factory: :post
  end
end
