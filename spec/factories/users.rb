FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Name.first_name }
    password { ENV['DEFAULT_USER_PASSWORD'] }
  end
end
