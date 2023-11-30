require 'rails_helper'

RSpec.describe 'BusinessesController', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:category) { FactoryBot.create(:category, user:) }

  before do
    sign_in user
  end

  describe 'GET /categories/:category_id/businesses' do
    it 'returns a successful response' do
      get "/categories/#{category.id}/businesses"

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /categories/:category_id/businesses/new' do
    it 'returns a successful response' do
      get "/categories/#{category.id}/businesses/new"

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /categories/:category_id/businesses' do
    context 'with valid parameters' do
      it 'creates a new business' do
        post "/categories/#{category.id}/businesses", params: { business: FactoryBot.attributes_for(:business) }

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(category_businesses_path(category))
        expect(flash[:notice]).to eq('Business was successfully created.')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new business' do
        post "/categories/#{category.id}/businesses", params: { business: { name: nil, amount: nil } }

        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:new)
      end
    end
  end
end
