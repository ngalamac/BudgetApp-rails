require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it 'belongs to an author (User)' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
      expect(association.class_name).to eq('User')
    end

    it 'has many businesses' do
      association = described_class.reflect_on_association(:businesses)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:dependent]).to eq(:destroy)
    end
  end

  describe 'validations' do
    it 'validates presence of icon' do
      category = Category.new(name: 'Example Category')
      category.valid?
      expect(category.errors[:icon]).to include("can't be blank")
    end
  end
end
