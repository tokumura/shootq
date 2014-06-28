require 'test_helper'

class ResultTnmtfirstsControllerTest < ActionController::TestCase
  setup do
    @result_tnmtfirst = result_tnmtfirsts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:result_tnmtfirsts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result_tnmtfirst" do
    assert_difference('ResultTnmtfirst.count') do
      post :create, result_tnmtfirst: { match_code: @result_tnmtfirst.match_code, score_l: @result_tnmtfirst.score_l, score_r: @result_tnmtfirst.score_r }
    end

    assert_redirected_to result_tnmtfirst_path(assigns(:result_tnmtfirst))
  end

  test "should show result_tnmtfirst" do
    get :show, id: @result_tnmtfirst
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result_tnmtfirst
    assert_response :success
  end

  test "should update result_tnmtfirst" do
    patch :update, id: @result_tnmtfirst, result_tnmtfirst: { match_code: @result_tnmtfirst.match_code, score_l: @result_tnmtfirst.score_l, score_r: @result_tnmtfirst.score_r }
    assert_redirected_to result_tnmtfirst_path(assigns(:result_tnmtfirst))
  end

  test "should destroy result_tnmtfirst" do
    assert_difference('ResultTnmtfirst.count', -1) do
      delete :destroy, id: @result_tnmtfirst
    end

    assert_redirected_to result_tnmtfirsts_path
  end
end
