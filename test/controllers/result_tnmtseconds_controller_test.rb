require 'test_helper'

class ResultTnmtsecondsControllerTest < ActionController::TestCase
  setup do
    @result_tnmtsecond = result_tnmtseconds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:result_tnmtseconds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result_tnmtsecond" do
    assert_difference('ResultTnmtsecond.count') do
      post :create, result_tnmtsecond: { match_code: @result_tnmtsecond.match_code, score_l: @result_tnmtsecond.score_l, score_r: @result_tnmtsecond.score_r }
    end

    assert_redirected_to result_tnmtsecond_path(assigns(:result_tnmtsecond))
  end

  test "should show result_tnmtsecond" do
    get :show, id: @result_tnmtsecond
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result_tnmtsecond
    assert_response :success
  end

  test "should update result_tnmtsecond" do
    patch :update, id: @result_tnmtsecond, result_tnmtsecond: { match_code: @result_tnmtsecond.match_code, score_l: @result_tnmtsecond.score_l, score_r: @result_tnmtsecond.score_r }
    assert_redirected_to result_tnmtsecond_path(assigns(:result_tnmtsecond))
  end

  test "should destroy result_tnmtsecond" do
    assert_difference('ResultTnmtsecond.count', -1) do
      delete :destroy, id: @result_tnmtsecond
    end

    assert_redirected_to result_tnmtseconds_path
  end
end
