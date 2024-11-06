require "test_helper"

class ViewControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get view_top_url
    assert_response :success
  end
end
