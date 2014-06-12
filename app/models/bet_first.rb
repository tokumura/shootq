class BetFirst < ActiveRecord::Base
  belongs_to :user

  def self.init
=begin
    BetFirst.destroy_all
    users = User.all
    users.each do |u|
      File.foreach("#{Rails.root}/public/bet_first.csv") do |line|
        row = CSV.parse(line)
        #row = CSV.parse(line.to_s.toutf8)
        bet = BetFirst.new
        bet.match_date = row[0][0].to_s
        bet.dayofweek = row[0][1].to_s
        bet.match_time = row[0][2].to_s
        bet.group_name = row[0][3].to_s
        bet.match_code = row[0][4].to_s
        bet.score_l = ""
        bet.score_r = ""
        bet.user_id = u.id
        bet.save
      end
    end
=end
  end

  def self.get_score user_id
    score_total = 0

    user = User.find_by id: user_id
    user.bet_firsts.each do |bf|
      result = get_result_code(bf.match_code)
      bet = get_bet_code(bf.match_code, user_id)

      if result != ""
        score_total = score_total + 3 if result[0,1] == bet[0,1]
        score_total = score_total + 3 if result[1..2] == bet[1..2]
      end
    end
    puts score_total
    puts
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

  def self.get_result_code match_code
    result = ""
    rf = ResultFirst.find_by match_code: match_code
    if rf.score_l != "" && rf.score_r != ""
      if rf.score_l.to_i > rf.score_r.to_i
        result = "l" + rf.score_l + rf.score_r
      elsif rf.score_l.to_i < rf.score_r.to_i
        result = "r" + rf.score_l + rf.score_r
      else
        result = "d" + rf.score_l + rf.score_r
      end
    end
    result
  end

  def self.get_bet_code match_code, user_id
    bet = ""
    bt = BetFirst.where("match_code = ? AND user_id = ?", match_code, user_id.to_s).first
    if bt.score_l.to_i > bt.score_r.to_i
      bet = "l" + bt.score_l + bt.score_r
    elsif bt.score_l.to_i < bt.score_r.to_i
      bet = "r" + bt.score_l + bt.score_r
    else
      bet = "d" + bt.score_l + bt.score_r
    end
    bet
  end
end
