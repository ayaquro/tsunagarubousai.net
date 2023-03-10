require "test_helper"

class Staff::GeneralUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_general_users_index_url
    assert_response :success
  end

  test "should get show" do
    get staff_general_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get staff_general_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get staff_general_users_update_url
    assert_response :success
  end
end
