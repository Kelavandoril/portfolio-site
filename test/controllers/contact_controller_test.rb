require "test_helper"

class ContactControllerTest < ActionDispatch::IntegrationTest
  include SessionTestHelper

  test "index should get no contact methods if empty" do
    get contact_index_url

    assert_response :success
  end
end
