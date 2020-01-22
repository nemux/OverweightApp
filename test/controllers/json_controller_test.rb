require 'test_helper'

class JsonControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get json_new_url
    assert_response :success
  end

  test "should get create" do
    get json_create_url
    assert_response :success
  end

end
