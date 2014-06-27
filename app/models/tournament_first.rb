class TournamentFirst < ActiveRecord::Base
  belongs_to :user

  def self.init
    matches = Array.new
    matches << "6/29 1:00,BRA-CHL"
    matches << "6/29 5:00,COL-URY"
    matches << "6/30 1:00,NLD-MEX"
    matches << "6/30 5:00,CRI-GRC"
    matches << "7/1 1:00,FRA-NGA"
    matches << "7/1 5:00,DEU-DZA"
    matches << "7/2 1:00,ARG-CHE"
    matches << "7/2 5:00,BEL-USA"

    TournamentFirst.destroy_all
    users = User.all
    users.each do |u|
      matches.each do |match|
        info = match.split(",")
        tm = TournamentFirst.new
        tm.match_date = info[0].to_s
        tm.match_code = info[1].to_s
        tm.score_l = ""
        tm.score_r = ""
        tm.user_id = u.id
        tm.save
      end
    end
  end
end
