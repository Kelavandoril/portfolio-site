require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "index should get no projects if empty" do
    get projects_url

    assert_response :success
  end

  test "index should get all valid projects" do
    project = projects(:first)
    assert project.save

    get projects_url

    assert_response :success
  end
end
