require 'test_helper'

class BetSecondsControllerTest < ActionController::TestCase
  setup do
    @bet_second = bet_seconds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bet_seconds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bet_second" do
    assert_difference('BetSecond.count') do
      post :create, bet_second: { a1: @bet_second.a1, a2: @bet_second.a2, b1: @bet_second.b1, b2: @bet_second.b2, c1: @bet_second.c1, c2: @bet_second.c2, d1: @bet_second.d1, d2: @bet_second.d2, e1: @bet_second.e1, e2: @bet_second.e2, f1: @bet_second.f1, f2: @bet_second.f2, g1: @bet_second.g1, g2: @bet_second.g2, h1: @bet_second.h1, h2: @bet_second.h2, user_id: @bet_second.user_id }
    end

    assert_redirected_to bet_second_path(assigns(:bet_second))
  end

  test "should show bet_second" do
    get :show, id: @bet_second
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bet_second
    assert_response :success
  end

  test "should update bet_second" do
    patch :update, id: @bet_second, bet_second: { a1: @bet_second.a1, a2: @bet_second.a2, b1: @bet_second.b1, b2: @bet_second.b2, c1: @bet_second.c1, c2: @bet_second.c2, d1: @bet_second.d1, d2: @bet_second.d2, e1: @bet_second.e1, e2: @bet_second.e2, f1: @bet_second.f1, f2: @bet_second.f2, g1: @bet_second.g1, g2: @bet_second.g2, h1: @bet_second.h1, h2: @bet_second.h2, user_id: @bet_second.user_id }
    assert_redirected_to bet_second_path(assigns(:bet_second))
  end

  test "should destroy bet_second" do
    assert_difference('BetSecond.count', -1) do
      delete :destroy, id: @bet_second
    end

    assert_redirected_to bet_seconds_path
  end
end
