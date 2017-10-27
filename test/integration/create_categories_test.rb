require 'test_helper'
class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "get new categorie form and create category" do
    get new_category_path
    assert_difference 'Category.count' do
      post '/categories', params: {category: {id: 1, name: "sports"} }
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "sports", response.body
  end
end