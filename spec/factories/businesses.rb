require 'faker'

FactoryBot.define do
  factory :business do
    name { Faker::Company.name }
    amount { Faker::Number.decimal(l_digits: 2) }
    user
    category
  end
end
