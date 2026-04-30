require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "generic user should be able to reach the page" do
    get root_url

    assert_response :success
  end
end
