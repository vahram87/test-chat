FactoryBot.define do
  factory :message do
    association :user
    association :room
    content { Faker::Lorem.sentence }
  end
end
