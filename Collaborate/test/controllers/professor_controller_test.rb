require 'test_helper'

class ProfessorControllerTest < ActionDispatch::IntegrationTest

  test "should get create" do
    get professor_create_url
    assert_response :success
  end

  test "should get new" do
    get professor_new_url
    assert_response :success
  end

  test "should get edit" do
    get professor_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get professor_destroy_url
    assert_response :success
  end

  test "should get projects" do
    get professor_projects_url
    assert_response :success
  end

  test "should get groups" do
    get professor_groups_url
    assert_response :success
  end

end
