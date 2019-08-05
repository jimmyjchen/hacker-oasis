require 'test_helper'

class CollaborationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get collaborations_index_url
    assert_response :success
  end

  test "should get show" do
    get collaborations_show_url
    assert_response :success
  end

  test "should get create" do
    get collaborations_create_url
    assert_response :success
  end

  test "should get profile" do
    get collaborations_profile_url
    assert_response :success
  end

end
