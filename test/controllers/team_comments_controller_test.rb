require 'test_helper'

class TeamCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_comments_index_url
    assert_response :success
  end

  test "should get show" do
    get team_comments_show_url
    assert_response :success
  end

  test "should get new" do
    get team_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get team_comments_create_url
    assert_response :success
  end

end
