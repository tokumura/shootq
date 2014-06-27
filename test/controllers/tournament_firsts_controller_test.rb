require 'test_helper'

class TournamentFirstsControllerTest < ActionController::TestCase
  setup do
    @tournament_first = tournament_firsts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_firsts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_first" do
    assert_difference('TournamentFirst.count') do
      post :create, tournament_first: { match_code: @tournament_first.match_code, score_l: @tournament_first.score_l, score_r: @tournament_first.score_r }
    end

    assert_redirected_to tournament_first_path(assigns(:tournament_first))
  end

  test "should show tournament_first" do
    get :show, id: @tournament_first
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_first
    assert_response :success
  end

  test "should update tournament_first" do
    patch :update, id: @tournament_first, tournament_first: { match_code: @tournament_first.match_code, score_l: @tournament_first.score_l, score_r: @tournament_first.score_r }
    assert_redirected_to tournament_first_path(assigns(:tournament_first))
  end

  test "should destroy tournament_first" do
    assert_difference('TournamentFirst.count', -1) do
      delete :destroy, id: @tournament_first
    end

    assert_redirected_to tournament_firsts_path
  end
end
