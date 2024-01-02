FactoryBot.define do
    factory :article do
      title { 'abhishekh' }
      subtopic {"hello"}
      content { 'miya kalifa' }
      association :user
      association :category
    end
  end   