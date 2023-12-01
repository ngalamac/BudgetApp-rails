require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }
  let(:business) { create(:business, category:) }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns @business' do
      get :new, params: { category_id: category.id }
      expect(assigns(:business)).to be_a_new(Business)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Business' do
        expect do
          post :create, params: { category_id: category.id, business: attributes_for(:business) }
        end.to change(Business, :count).by(1)
      end

      it 'assigns a newly created business as @business' do
        post :create, params: { category_id: category.id, business: attributes_for(:business) }
        expect(assigns(:business)).to be_a(Business)
        expect(assigns(:business)).to be_persisted
      end

      it 'redirects to the created business' do
        post :create, params: { category_id: category.id, business: attributes_for(:business) }
        expect(response).to redirect_to(category_businesses_path(category))
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved business as @business' do
        allow_any_instance_of(Business).to receive(:save).and_return(false)
        post :create, params: { category_id: category.id, business: attributes_for(:business) }
        expect(assigns(:business)).to be_a_new(Business)
      end

      it 're-renders the "new" template' do
        allow_any_instance_of(Business).to receive(:save).and_return(false)
        post :create, params: { category_id: category.id, business: attributes_for(:business) }
        expect(response).to render_template('new')
      end
    end
  end
end
