require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_path
    assert_response :success
  end
  test "should get page by name" do
    get categoryname_path name: "First"
    assert_response :success
  end
end
