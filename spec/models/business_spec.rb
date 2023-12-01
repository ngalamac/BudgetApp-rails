require 'rails_helper'

RSpec.describe Business, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a category' do
      association = described_class.reflect_on_association(:category)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe 'validations' do
    it 'validates presence of name' do
      business = Business.new(amount: 100, user: User.new, category: Category.new)
      business.valid?
      expect(business.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of amount' do
      business = Business.new(name: 'Example Business', user: User.new, category: Category.new)
      business.valid?
      expect(business.errors[:amount]).to include("can't be blank")
    end

    it 'is valid with a name, amount, user, and category' do
      user = User.create(name: 'John', email: 'john@gmail.com', password: '123456')
      category = Category.create(name: 'Example Category')
      business = Business.new(name: 'Example Business', amount: 100, user:, category:)
      expect(business.valid?).to eq(true)
    end
  end
end
