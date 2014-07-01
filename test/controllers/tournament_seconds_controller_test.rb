require 'test_helper'

class TournamentSecondsControllerTest < ActionController::TestCase
  setup do
    @tournament_second = tournament_seconds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_seconds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_second" do
    assert_difference('TournamentSecond.count') do
      post :create, tournament_second: { match_code: @tournament_second.match_code, score_l: @tournament_second.score_l, score_r: @tournament_second.score_r, user_id: @tournament_second.user_id }
    end

    assert_redirected_to tournament_second_path(assigns(:tournament_second))
  end

  test "should show tournament_second" do
    get :show, id: @tournament_second
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_second
    assert_response :success
  end

  test "should update tournament_second" do
    patch :update, id: @tournament_second, tournament_second: { match_code: @tournament_second.match_code, score_l: @tournament_second.score_l, score_r: @tournament_second.score_r, user_id: @tournament_second.user_id }
    assert_redirected_to tournament_second_path(assigns(:tournament_second))
  end

  test "should destroy tournament_second" do
    assert_difference('TournamentSecond.count', -1) do
      delete :destroy, id: @tournament_second
    end

    assert_redirected_to tournament_seconds_path
  end
end
