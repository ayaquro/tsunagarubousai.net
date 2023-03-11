require "test_helper"

class Staff::PostedCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_posted_comments_index_url
    assert_response :success
  end

  test "should get destroy" do
    get staff_posted_comments_destroy_url
    assert_response :success
  end
end
