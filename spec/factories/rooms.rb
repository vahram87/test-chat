FactoryBot.define do
  factory :room do
    name { Faker::Name.unique.name }
    is_public { true }
  end
end
