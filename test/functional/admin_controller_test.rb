require 'test_helper'

class Admin::AdminControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get nouse" do
    get :nouse
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get user_index" do
    get :user_index
    assert_response :success
  end

end
