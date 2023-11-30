# spec/features/business_integration_spec.rb
require 'rails_helper'

RSpec.feature 'Business integration tests', type: :feature do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  before do
    sign_in user
  end

  scenario 'User visits the new business page' do
    visit new_category_business_path(category)
    expect(page).to have_content('Business')
    expect(page).to have_field('business_name')
    expect(page).to have_field('business_amount')
  end
end
