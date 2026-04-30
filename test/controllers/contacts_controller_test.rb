require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "index should get no ContactMethods if empty" do
    get contacts_url

    assert_response :success
  end

  test "index should get all created ContactMethods" do
    contact = contacts(:first)
    assert contact.save

    get contacts_url

    assert_response :success
  end
end
