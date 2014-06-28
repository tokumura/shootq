class ResultTnmtfirst < ActiveRecord::Base

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

    ResultTnmtfirst.destroy_all
    matches.each do |m|
      info = m.split(",")
      rtf = ResultTnmtfirst.new
      rtf.match_code = info[1]
      rtf.score_l = (rand(4) + 1).to_s
      rtf.score_r = (rand(4) + 1).to_s
      rtf.save
    end
  end
end
