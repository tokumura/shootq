require 'test_helper'

class ResultSecondsControllerTest < ActionController::TestCase
  setup do
    @result_second = result_seconds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:result_seconds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result_second" do
    assert_difference('ResultSecond.count') do
      post :create, result_second: { countries: @result_second.countries, group_name: @result_second.group_name }
    end

    assert_redirected_to result_second_path(assigns(:result_second))
  end

  test "should show result_second" do
    get :show, id: @result_second
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result_second
    assert_response :success
  end

  test "should update result_second" do
    patch :update, id: @result_second, result_second: { countries: @result_second.countries, group_name: @result_second.group_name }
    assert_redirected_to result_second_path(assigns(:result_second))
  end

  test "should destroy result_second" do
    assert_difference('ResultSecond.count', -1) do
      delete :destroy, id: @result_second
    end

    assert_redirected_to result_seconds_path
  end
end
