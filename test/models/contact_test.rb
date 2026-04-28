require "test_helper"

class ContactTest < ActiveSupport::TestCase
  test "should not save new contact without logo" do
    contact = Contact.new(username: "Test username", service_name: "Test service name")
    assert_not contact.save
  end
end
