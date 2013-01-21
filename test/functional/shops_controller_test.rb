require 'test_helper'

class ShopAdmin::ShopsControllerTest < ActionController::TestCase
  test "should get noregist" do
    get :noregist
    assert_response :success
  end

  test "should get regist" do
    get :regist
    assert_response :success
  end

  test "should get doregist" do
    get :doregist
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get make_checkin_item" do
    get :make_checkin_item
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get paypal" do
    get :paypal
    assert_response :success
  end

  test "should get paypal_callback" do
    get :paypal_callback
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop" do
    assert_difference('Shop.count') do
      post :create, shop: { fbShopid: @shop.fbShopid, fbname: @shop.fbname, limit_date: @shop.limit_date, manager_mail: @shop.manager_mail, manager_name: @shop.manager_name, manager_tel: @shop.manager_tel, payment_date: @shop.payment_date, shop_name: @shop.shop_name, start_date: @shop.start_date, status: @shop.status }
    end

    assert_redirected_to shop_path(assigns(:shop))
  end

  test "should show shop" do
    get :show, id: @shop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop
    assert_response :success
  end

  test "should update shop" do
    put :update, id: @shop, shop: { fbShopid: @shop.fbShopid, fbname: @shop.fbname, limit_date: @shop.limit_date, manager_mail: @shop.manager_mail, manager_name: @shop.manager_name, manager_tel: @shop.manager_tel, payment_date: @shop.payment_date, shop_name: @shop.shop_name, start_date: @shop.start_date, status: @shop.status }
    assert_redirected_to shop_path(assigns(:shop))
  end

  test "should destroy shop" do
    assert_difference('Shop.count', -1) do
      delete :destroy, id: @shop
    end

    assert_redirected_to shops_path
  end

end
