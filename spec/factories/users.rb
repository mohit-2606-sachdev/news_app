FactoryBot.define do
    factory :user do
      name { 'Test' }
      email {"test01@gmail.com"}
      password {"password"}
      password_confirmation {"password"}
    end
  end   