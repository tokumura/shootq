class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    @score_list = Array.new
    temp_list = Array.new
    users = User.all
    users.each do |u|
      score = BetFirst.get_score u.id
      score_info = Array.new
      score_info << u.user_info.name
      score_info << score.to_i
      temp_list << score_info
    end
    @score_list = temp_list.sort{|a,b|
      b[1] <=> a[1]
    }

    @graph_data = Array.new
    hash = Hash.new
    hash.store("fillColor", "rgba(255,255,255,0)")
    hash.store("strokeColor", "rgba(220,220,220,1)")
    hash.store("pointColor", "rgba(220,220,220,1)")
    hash.store("pointStrokeColor", "#fff")
    hash.store("data", [3,5,7,8,5,3,7,8,2])
    @graph_data << hash
    puts @graph_data
  end
end

