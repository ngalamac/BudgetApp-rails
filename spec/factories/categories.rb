# spec/factories/categories.rb

FactoryBot.define do
  factory :category do
    name { Faker::Lorem.word }
    icon { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/icon.png')), 'image/png') }
    user
  end
end
