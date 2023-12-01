FactoryBot.define do
  factory :business do
    name { Faker::Lorem.word }
    amount { Faker::Number.decimal(l_digits: 2) }
    category
    user
  end
end
