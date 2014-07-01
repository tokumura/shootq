class ResultTnmtsecond < ActiveRecord::Base
  def self.init
    matches = Array.new
    matches << "7/4 1:00,FRA-DEU"
    matches << "7/5 1:00,ARG-BEL"
    matches << "7/5 5:00,BRA-COL"
    matches << "7/6 5:00,NLD-CRI"

    ResultTnmtsecond.destroy_all
    matches.each do |m|
      info = m.split(",")
      rtf = ResultTnmtsecond.new
      rtf.match_code = info[1]
      rtf.score_l = ""
      rtf.score_r = ""
      rtf.save
    end
  end
end
