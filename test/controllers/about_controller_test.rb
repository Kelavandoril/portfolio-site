require "test_helper"

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "generic user should be able to reach the page" do
    get about_info_url

    assert_response :success
  end
end
