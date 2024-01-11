FactoryBot.define do
  factory :user do
    name { 'Gladwin Ramantso' }
    photo { 'example.jpg' }
    bio { 'Developer from South Africa' }
    post_counter { 0 }
  end
end
