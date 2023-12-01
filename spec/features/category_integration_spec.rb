require 'rails_helper'

RSpec.feature 'Category integration tests', type: :feature do
  let(:user) { create(:user) }

  before do
    sign_in user
    @categories = create_list(:category, 3, user:)
  end

  scenario 'User visits the categories page' do
    visit categories_path

    expect(page).to have_content('Categories')
    expect(page).to have_link('Most Recent', href: categories_path(sort_by: 'most_recent'))
    expect(page).to have_link('Most Ancient', href: categories_path(sort_by: 'most_ancient'))
    expect(page).to have_content('Back')

    if @categories.empty?
      expect(page).to have_content("You don't have any categories in your list yet. Please Add...")
    else
      expect(page).to have_selector('.category', count: @categories.count)

      @categories.each do |category|
        expect(page).to have_css("img[alt='#{category.name} icon']") if category.icon.attached?
        expect(page).to have_content(category.name)
        expect(page).to have_content("$#{category.total_amount}")
        expect(page).to have_link('New category', href: new_category_path)
      end
    end
  end
end
