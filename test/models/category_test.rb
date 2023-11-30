# test/models/category_test.rb
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:businesses).dependent(:destroy)
  should validate_presence_of(:name)
  should validate_presence_of(:icon)

  test 'total_amount sums up business amounts' do
    user = users(:one) # assuming you have fixtures or factories for users
    category = Category.create(name: 'Test Category', user:, icon: fixture_file_upload('test_icon.png'))

    # Create businesses associated with the category
    Business.create(name: 'Business 1', amount: 100, category:)
    Business.create(name: 'Business 2', amount: 200, category:)

    assert_equal 300, category.total_amount
  end
end
