require 'test_helper'

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get 404" do
    get "404"
    assert_response :success
  end
  test "should get 422" do
    get "422"
    assert_response :success
  end
  test "should get 500" do
    get "500"
    assert_response :success
  end
end
