class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    @score_list = Array.new
    temp_list = Array.new
    users = User.all
    users.each do |u|
      score = BetFirst.get_score u.id
      score_2 = BetSecond.get_score u.id
      score = score + score_2
      score_info = Array.new
      score_info << u.user_info.name
      score_info << score.to_i
      temp_list << score_info
    end
    @score_list = temp_list.sort{|a,b|
      b[1] <=> a[1]
    }

    ranking_history = BetFirst.get_ranking_history(current_user.id)

    @graph_data = Array.new
    hash = Hash.new
    hash.store("fillColor", "rgba(255,255,255,0)")
    hash.store("strokeColor", "#dc143c")
    hash.store("pointColor", "#dc143c")
    hash.store("pointStrokeColor", "#f00")
    hash.store("data", ranking_history)
    @graph_data << hash

    users = User.order("id")
    @usernames = Hash.new
    @usernames.store("", 0)
    users.each do |u|
      @usernames.store(u.user_info.name, u.id.to_s)
    end
  end

  def load_graph
    user_id = params["user_id"]
    user = User.find_by id: user_id.to_i
    @owner = user.user_info.name

    ranking_history = BetFirst.get_ranking_history(user.id.to_i)

    @graph_data = Array.new
    hash = Hash.new
    hash.store("fillColor", "rgba(255,255,255,0)")
    hash.store("strokeColor", "#dc143c")
    hash.store("pointColor", "#dc143c")
    hash.store("pointStrokeColor", "#f00")
    hash.store("data", ranking_history)
    @graph_data << hash
  end
end

