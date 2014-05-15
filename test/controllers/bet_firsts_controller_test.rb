require 'test_helper'

class BetFirstsControllerTest < ActionController::TestCase
  setup do
    @bet_first = bet_firsts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bet_firsts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bet_first" do
    assert_difference('BetFirst.count') do
      post :create, bet_first: { match_code: @bet_first.match_code, score: @bet_first.score, user_id: @bet_first.user_id }
    end

    assert_redirected_to bet_first_path(assigns(:bet_first))
  end

  test "should show bet_first" do
    get :show, id: @bet_first
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bet_first
    assert_response :success
  end

  test "should update bet_first" do
    patch :update, id: @bet_first, bet_first: { match_code: @bet_first.match_code, score: @bet_first.score, user_id: @bet_first.user_id }
    assert_redirected_to bet_first_path(assigns(:bet_first))
  end

  test "should destroy bet_first" do
    assert_difference('BetFirst.count', -1) do
      delete :destroy, id: @bet_first
    end

    assert_redirected_to bet_firsts_path
  end
end
