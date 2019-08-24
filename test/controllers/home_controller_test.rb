require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end

  test "should get login" do
    get home_login_url
    assert_response :success
  end

  test "should get form" do
    get home_form_url
    assert_response :success
  end

  test "should get matches" do
    get home_matches_url
    assert_response :success
  end

  test "should get chat" do
    get home_chat_url
    assert_response :success
  end

  test "should get notify" do
    get home_notify_url
    assert_response :success
  end

end
