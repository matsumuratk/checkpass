require 'test_helper'

class CheckinControllerControllerTest < ActionController::TestCase
  test "should get place" do
    get :place
    assert_response :success
  end

  test "should get docheckin" do
    get :docheckin
    assert_response :success
  end

  test "should get showplace" do
    get :showplace
    assert_response :success
  end

end
