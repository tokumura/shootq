require 'test_helper'

class ResultFirstsControllerTest < ActionController::TestCase
  setup do
    @result_first = result_firsts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:result_firsts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create result_first" do
    assert_difference('ResultFirst.count') do
      post :create, result_first: { dayofweek: @result_first.dayofweek, group_name: @result_first.group_name, match_code: @result_first.match_code, match_date: @result_first.match_date, match_time: @result_first.match_time, score_l: @result_first.score_l, score_r: @result_first.score_r }
    end

    assert_redirected_to result_first_path(assigns(:result_first))
  end

  test "should show result_first" do
    get :show, id: @result_first
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @result_first
    assert_response :success
  end

  test "should update result_first" do
    patch :update, id: @result_first, result_first: { dayofweek: @result_first.dayofweek, group_name: @result_first.group_name, match_code: @result_first.match_code, match_date: @result_first.match_date, match_time: @result_first.match_time, score_l: @result_first.score_l, score_r: @result_first.score_r }
    assert_redirected_to result_first_path(assigns(:result_first))
  end

  test "should destroy result_first" do
    assert_difference('ResultFirst.count', -1) do
      delete :destroy, id: @result_first
    end

    assert_redirected_to result_firsts_path
  end
end
