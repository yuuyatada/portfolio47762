require "test_helper"

class UserComments　createControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get user_comments　create_destroy_url
    assert_response :success
  end
end
