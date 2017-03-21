require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categories_path
    assert_response :success
  end
end
