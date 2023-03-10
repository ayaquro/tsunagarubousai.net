require "test_helper"

class Staff::PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get staff_posts_show_url
    assert_response :success
  end

  test "should get edit" do
    get staff_posts_edit_url
    assert_response :success
  end

  test "should get update" do
    get staff_posts_update_url
    assert_response :success
  end
end
