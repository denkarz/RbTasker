require 'test_helper'

class CustomControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get custom_controller_index_url
    assert_response :success
  end

  test "should get update" do
    get custom_controller_update_url
    assert_response :success
  end

  test "should get create" do
    get custom_controller_create_url
    assert_response :success
  end

end
