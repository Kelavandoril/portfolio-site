require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "should not save new project without title" do
    project = Project.new(description: "Some description")
    assert_not project.save
  end

  test "should not save new project without description" do
    project = Project.new(title: "Some title")
    assert_not project.save
  end
end
