require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "index should get no contacts if empty" do
    get contacts_url

    assert_response :success
  end

  test "index should get all created contacts" do
    contact = contacts(:first)
    assert contact.save

    get contacts_url

    assert_response :success
  end
end
