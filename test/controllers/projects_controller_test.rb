require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  include SessionTestHelper

  test "index should get no projects if empty" do
    get projects_url

    assert_response :success
  end

  test "index should get all valid projects" do
    project = projects(:first)
    assert project.save

    get projects_url

    assert_response :success
    assert_in_body project.title
  end

  test "admin user should be able to update a project" do
    sign_in_as(users(:admin))
    project = projects(:first)

    patch project_url(project), params: { project: { title: "updated" } }

    assert_redirected_to project_path(project)
    project.reload
    assert_equal "updated", project.title
  end

  test "generic user should not be able to create a new project" do
    get new_project_url

    assert_response :redirect

    put new_project_url(1)

    assert_response :redirect
  end

  test "generic user should not be able to delete a project" do
    delete project_url(1)

    assert_response :redirect
  end
end
