require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it 'has many categories' do
      expect(described_class.reflect_on_association(:categories).macro).to eq(:has_many)
    end

    it 'has many businesses' do
      expect(described_class.reflect_on_association(:businesses).macro).to eq(:has_many)
    end
  end

  context 'validations' do
    it 'requires name to be present' do
      user = User.new(email: 'macngala4@gmail.com', password: '123456')
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is valid with a name' do
      user = User.new(name: 'Mac', email: 'macngala4@gmail.com', password: '123456')
      expect(user).to be_valid
    end
  end
end
