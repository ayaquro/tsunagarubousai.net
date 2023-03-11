require "test_helper"

class Staff::DistrictsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_districts_index_url
    assert_response :success
  end

  test "should get create" do
    get staff_districts_create_url
    assert_response :success
  end

  test "should get edit" do
    get staff_districts_edit_url
    assert_response :success
  end

  test "should get update" do
    get staff_districts_update_url
    assert_response :success
  end
end
