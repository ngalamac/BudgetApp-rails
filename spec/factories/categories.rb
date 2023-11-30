require 'faker'

FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    icon { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'icon.png'), 'image/jpg') }
    user
  end
end
