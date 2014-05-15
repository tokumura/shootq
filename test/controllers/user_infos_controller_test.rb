require 'test_helper'

class UserInfosControllerTest < ActionController::TestCase
  setup do
    @user_info = user_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_info" do
    assert_difference('UserInfo.count') do
      post :create, user_info: { name: @user_info.name, point_first: @user_info.point_first, point_second: @user_info.point_second, point_third: @user_info.point_third, point_total: @user_info.point_total }
    end

    assert_redirected_to user_info_path(assigns(:user_info))
  end

  test "should show user_info" do
    get :show, id: @user_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_info
    assert_response :success
  end

  test "should update user_info" do
    patch :update, id: @user_info, user_info: { name: @user_info.name, point_first: @user_info.point_first, point_second: @user_info.point_second, point_third: @user_info.point_third, point_total: @user_info.point_total }
    assert_redirected_to user_info_path(assigns(:user_info))
  end

  test "should destroy user_info" do
    assert_difference('UserInfo.count', -1) do
      delete :destroy, id: @user_info
    end

    assert_redirected_to user_infos_path
  end
end
