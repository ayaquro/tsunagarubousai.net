require "test_helper"

class GeneralUser::GeneralUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get general_user_general_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get general_user_general_users_edit_url
    assert_response :success
  end
end
