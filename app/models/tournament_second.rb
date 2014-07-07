class TournamentSecond < ActiveRecord::Base
  belongs_to :user

  def self.get_score user_id
    score_total = 0

    user = User.find_by id: user_id
    user.tournament_seconds.each do |tf|
      result = get_result_code(tf.match_code)
      bet = get_bet_code(tf.match_code, user_id)

      if result != ""
        score_total = score_total + 3 if result[0,1] == bet[0,1]
        score_total = score_total + 3 if result[1..2] == bet[1..2]
      end
    end
    score_total
  end

  def self.get_bgcolor bet_code, result_code
    color = ""
    if bet_code.size >= 3
      if result_code[0,1] == bet_code[0,1]
        color = "background:#98fb98"
        if result_code[1..2] == bet_code[1..2]
          color = "background:#ff8e8e"
        end
      end
    end
    color
  end

  def self.get_bet_code match_code, user_id
    bet = ""
    bt = TournamentSecond.where("match_code = ? AND user_id = ?", match_code, user_id.to_s).first
    if bt.score_l.to_i > bt.score_r.to_i
      bet = "l" + bt.score_l.to_s + bt.score_r.to_s
    elsif bt.score_l.to_i < bt.score_r.to_i
      bet = "r" + bt.score_l.to_s + bt.score_r.to_s
    else
      bet = "d" + bt.score_l.to_s + bt.score_r.to_s
    end
    bet
  end

  def self.get_result_code match_code
    result = ""
    rf = ResultTnmtsecond.find_by match_code: match_code
    if rf.score_l != "" && rf.score_r != ""
      if rf.score_l.to_i > rf.score_r.to_i
        result = "l" + rf.score_l.to_s + rf.score_r.to_s
      elsif rf.score_l.to_i < rf.score_r.to_i
        result = "r" + rf.score_l.to_s + rf.score_r.to_s
      else
        result = "d" + rf.score_l.to_s + rf.score_r.to_s
      end
    end
    result
  end


  def self.init
=begin
    matches = Array.new
    matches << "7/5 1:00,FRA-DEU"
    matches << "7/5 5:00,BRA-COL"
    matches << "7/6 1:00,ARG-BEL"
    matches << "7/6 5:00,NLD-CRI"

    TournamentSecond.destroy_all
    users = User.all
    users.each do |u|
      matches.each do |match|
        info = match.split(",")
        tm = TournamentSecond.new
        tm.match_date = info[0].to_s
        tm.match_code = info[1].to_s
        #tm.score_l = (rand(3) + 1).to_s
        #tm.score_r = (rand(3) + 1).to_s
        tm.score_l = ""
        tm.score_r = ""
        tm.user_id = u.id
        tm.save
      end
    end
=end
  end

  def self.init_semifinal
=begin
    matches = Array.new
    matches << "7/9 5:00,BRA-DEU"
    matches << "7/10 5:00,NLD-ARG"

    users = User.all
    users.each do |u|
      matches.each do |match|
        info = match.split(",")
        tm = TournamentSecond.new
        tm.match_date = info[0].to_s
        tm.match_code = info[1].to_s
        tm.score_l = (rand(3) + 1).to_s
        tm.score_r = (rand(3) + 1).to_s
        #tm.score_l = ""
        #tm.score_r = ""
        tm.user_id = u.id
        tm.save
      end
    end
=end
  end
end
