FactoryBot.define do
  factory :post do
   title { 'God is Good' }
   text { 'Let your whole like prove that God is Good' }
   comments_counter { 0 }
   likes_counter { 0 }
   association :author, factory: :user
  end
end
