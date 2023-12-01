require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user:) }

  before do
    sign_in user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get category_path(category)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get new_category_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    it 'updates the category' do
      patch category_path(category), params: { category: { name: 'Updated Category' } }
      category.reload
      expect(category.name).to eq('Updated Category')
    end
  end
end
