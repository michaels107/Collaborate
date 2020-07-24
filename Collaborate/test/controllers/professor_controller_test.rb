require 'test_helper'

class ProfessorControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get professor_new_path
    assert_response :success
  end

end
