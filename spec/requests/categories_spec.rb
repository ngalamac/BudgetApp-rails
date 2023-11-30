require 'rails_helper'

RSpec.describe 'CategoriesController', type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe 'GET /categories' do
    it 'returns a successful response' do
      get '/categories'

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /categories/:id' do
    it 'returns a successful response' do
      category = FactoryBot.create(:category, user: user)
      get "/categories/#{category.id}"

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /categories/new' do
    it 'returns a successful response' do
      get '/categories/new'

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /categories' do
    context 'with valid parameters' do
      it 'creates a new category' do
        post '/categories', params: { category: FactoryBot.attributes_for(:category) }

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(categories_path)
        expect(flash[:notice]).to eq('Category was successfully created.')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new category' do
        post '/categories', params: { category: { name: nil, icon: nil } }

        expect(response).to have_http_status(:ok)
        expect(response).to render_template(:new)
      end
    end
  end
end
