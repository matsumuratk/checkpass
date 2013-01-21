require 'test_helper'

class CheckinItemsControllerTest < ActionController::TestCase
  setup do
    @checkin_item = checkin_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:checkin_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create checkin_item" do
    assert_difference('CheckinItem.count') do
      post :create, checkin_item: { access_key: @checkin_item.access_key, comment_title: @checkin_item.comment_title, coupon_image: @checkin_item.coupon_image, coupon_message: @checkin_item.coupon_message, fbCategory: @checkin_item.fbCategory, fbCheckinid: @checkin_item.fbCheckinid, fbCity: @checkin_item.fbCity, fbCountry: @checkin_item.fbCountry, fbName: @checkin_item.fbName, fbShopid: @checkin_item.fbShopid, fbState: @checkin_item.fbState, fbStreet: @checkin_item.fbStreet, middle_image: @checkin_item.middle_image, title: @checkin_item.title, top_image: @checkin_item.top_image }
    end

    assert_redirected_to checkin_item_path(assigns(:checkin_item))
  end

  test "should show checkin_item" do
    get :show, id: @checkin_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @checkin_item
    assert_response :success
  end

  test "should update checkin_item" do
    put :update, id: @checkin_item, checkin_item: { access_key: @checkin_item.access_key, comment_title: @checkin_item.comment_title, coupon_image: @checkin_item.coupon_image, coupon_message: @checkin_item.coupon_message, fbCategory: @checkin_item.fbCategory, fbCheckinid: @checkin_item.fbCheckinid, fbCity: @checkin_item.fbCity, fbCountry: @checkin_item.fbCountry, fbName: @checkin_item.fbName, fbShopid: @checkin_item.fbShopid, fbState: @checkin_item.fbState, fbStreet: @checkin_item.fbStreet, middle_image: @checkin_item.middle_image, title: @checkin_item.title, top_image: @checkin_item.top_image }
    assert_redirected_to checkin_item_path(assigns(:checkin_item))
  end

  test "should destroy checkin_item" do
    assert_difference('CheckinItem.count', -1) do
      delete :destroy, id: @checkin_item
    end

    assert_redirected_to checkin_items_path
  end
end
