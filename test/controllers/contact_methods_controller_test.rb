require "test_helper"

class ContactMethodsControllerTest < ActionDispatch::IntegrationTest
  include SessionTestHelper

  test "index should get no contact methods if empty" do
    get contact_methods_url

    assert_response :success
  end

  test "index should get all created contact methods" do
    contact = contact_methods(:first)
    assert contact.save

    get contact_methods_url

    assert_response :success
    assert_in_body contact.service_name
  end

  test "admin user should be able to update a contact method" do
    sign_in_as(users(:admin))
    contact_method = contact_methods(:first)

    patch contact_method_url(contact_method), params: { contact_method: { link_url: "http://google.com" } }

    assert_redirected_to contact_methods_path
    contact_method.reload
    assert_equal "http://google.com", contact_method.link_url
  end

  test "generic user should not be able to create a new contact method" do
    contact_method = contact_methods(:first)

    post contact_methods_url, params: { contact_method: { service_name: contact_method.service_name, username: contact_method.username, link_url: contact_method.link_url } }

    assert_redirected_to new_session_url
  end

  test "admin user should be able to create a new contact method" do
    sign_in_as(users(:admin))

    assert_difference("ContactMethod.count", 1) do
      post contact_methods_url, params: { contact_method: { service_name: "SomeService", username: "someusername", link_url: "https://linkedin.com", logo: fixture_file_upload("test/fixtures/files/linkedin.png", "image/png") } }
    end

    assert_redirected_to contact_methods_url
  end

  test "generic user should not be able to delete a contact method" do
    contact_method = contact_methods(:first)
    assert_difference("ContactMethod.count", 0) do
      delete contact_method_url(contact_method)
    end

    assert_redirected_to new_session_url
  end

  test "admin user should be able to delete a contact method" do
    sign_in_as(users(:admin))
    contact_method = contact_methods(:first)
    assert_difference("ContactMethod.count", -1) do
      delete contact_method_url(contact_method)
    end

    assert_redirected_to contact_methods_url
  end
end
