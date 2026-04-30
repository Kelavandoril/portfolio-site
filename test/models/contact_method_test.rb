require "test_helper"

class ContactMethodTest < ActiveSupport::TestCase
  test "should not save new contact_method without logo" do
    contact = ContactMethod.new(username: "Test username", service_name: "Test service name")
    assert_not contact.save
  end
end
