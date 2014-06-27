require 'test_helper'

class BetWinnersControllerTest < ActionController::TestCase
  setup do
    @bet_winner = bet_winners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bet_winners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bet_winner" do
    assert_difference('BetWinner.count') do
      post :create, bet_winner: { winner_first: @bet_winner.winner_first, winner_second: @bet_winner.winner_second, winner_third: @bet_winner.winner_third }
    end

    assert_redirected_to bet_winner_path(assigns(:bet_winner))
  end

  test "should show bet_winner" do
    get :show, id: @bet_winner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bet_winner
    assert_response :success
  end

  test "should update bet_winner" do
    patch :update, id: @bet_winner, bet_winner: { winner_first: @bet_winner.winner_first, winner_second: @bet_winner.winner_second, winner_third: @bet_winner.winner_third }
    assert_redirected_to bet_winner_path(assigns(:bet_winner))
  end

  test "should destroy bet_winner" do
    assert_difference('BetWinner.count', -1) do
      delete :destroy, id: @bet_winner
    end

    assert_redirected_to bet_winners_path
  end
end
