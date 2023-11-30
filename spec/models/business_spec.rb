# spec/models/business_spec.rb
require 'rails_helper'

RSpec.describe Business, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many categories' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:dependent]).to eq(:destroy)
      expect(association.options[:foreign_key]).to eq(:business_id)
    end
  end

  describe 'validations' do
    it 'validates presence of name' do
      business = Business.new(amount: 100) # Adjust the attributes as needed
      business.valid?
      expect(business.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of amount' do
      business = Business.new(name: 'Example Business') # Adjust the attributes as needed
      business.valid?
      expect(business.errors[:amount]).to include("can't be blank")
    end

    it 'is valid with a name and amount' do
      user = User.create(name: 'John', email: 'john@gmail.com', password: '123456')
      business = Business.new(name: 'Example Business', amount: 100, user:) # Adjust the attributes as needed
      expect(business.valid?).to eq(true)
    end
  end
end
