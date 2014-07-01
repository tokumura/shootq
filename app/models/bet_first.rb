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

  def self.get_ranking_history user_id

    score_all = Hash.new
    User.order("id").each do |u|
      score_all.store(u.id.to_s, 0)
    end

    history = Array.new
    ResultFirst.order("id").each do |r|
      score_list = Array.new
      temp_list = Array.new
      result = get_result_code r.match_code

      # Group Stage
      if result != ""
        User.order("id").each do |u|
          score = 0
          bet = get_bet_code(r.match_code, u.id)
          if result != ""
            score = score + 3 if result[0,1] == bet[0,1]
            score = score + 3 if result[1..2] == bet[1..2]
          end
          score_all.store(u.id.to_s, score_all[u.id.to_s].to_i + score.to_i)
          score_info = Array.new
          score_info << u.user_info.name
          score_info << score_all[u.id.to_s].to_i
          temp_list << score_info
        end
        score_list = temp_list.sort{|a,b|
          b[1] <=> a[1]
        }

        user = User.find_by id: user_id
        rank = 1
        score_list.each_with_index do |s, i|
          if i > 0
            rank = rank + 1
            if score_list[i-1][1] == s[1]
              rank = rank - 1
            end
          end
          if user.user_info.name == s[0].to_s
            history << (rank - 13).abs
          end
        end
      end
    end

    # Tournament Countries
    history = add_ranking_history_bet_second(history, score_all, user_id)

    # Tournament 16
    history = add_ranking_history_tournament16(history, score_all, user_id)



    history
  end

  def self.add_ranking_history_tournament16 history, score_all, user_id
    ResultTnmtfirst.order("id").each do |r|
      score_list = Array.new
      temp_list = Array.new
      result = TournamentFirst.get_result_code r.match_code

      # Group Stage
      if result != ""
        User.order("id").each do |u|
          score = 0
          bet = TournamentFirst.get_bet_code(r.match_code, u.id)
          if result != ""
            score = score + 3 if result[0,1] == bet[0,1]
            score = score + 3 if result[1..2] == bet[1..2]
          end
          score_all.store(u.id.to_s, score_all[u.id.to_s].to_i + score.to_i)
          score_info = Array.new
          score_info << u.user_info.name
          score_info << score_all[u.id.to_s].to_i
          temp_list << score_info
        end
        score_list = temp_list.sort{|a,b|
          b[1] <=> a[1]
        }

        user = User.find_by id: user_id
        rank = 1
        score_list.each_with_index do |s, i|
          if i > 0
            rank = rank + 1
            if score_list[i-1][1] == s[1]
              rank = rank - 1
            end
          end
          if user.user_info.name == s[0].to_s
            history << (rank - 13).abs
          end
        end
      end
    end
    history
  end

  def self.add_ranking_history_bet_second history, score_all, user_id
    score_list = Array.new
    temp_list = Array.new

    User.order("id").each do |u|
      score = BetSecond.get_score(u.id)
      score_all.store(u.id.to_s, score_all[u.id.to_s].to_i + score.to_i)
      score_info = Array.new
      score_info << u.user_info.name
      score_info << score_all[u.id.to_s].to_i
      temp_list << score_info
    end
    score_list = temp_list.sort{|a,b|
      b[1] <=> a[1]
    }

    user = User.find_by id: user_id
    rank = 1
    score_list.each_with_index do |s, i|
      if i > 0
        rank = rank + 1
        if score_list[i-1][1] == s[1]
          rank = rank - 1
        end
      end
      if user.user_info.name == s[0].to_s
        history << (rank - 13).abs
      end
    end
    history
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
        result = "l" + rf.score_l.to_s + rf.score_r.to_s
      elsif rf.score_l.to_i < rf.score_r.to_i
        result = "r" + rf.score_l.to_s + rf.score_r.to_s
      else
        result = "d" + rf.score_l.to_s + rf.score_r.to_s
      end
    end
    result
  end

  def self.get_bet_code match_code, user_id
    bet = ""
    bt = BetFirst.where("match_code = ? AND user_id = ?", match_code, user_id.to_s).first
    if bt.score_l.to_i > bt.score_r.to_i
      bet = "l" + bt.score_l.to_s + bt.score_r.to_s
    elsif bt.score_l.to_i < bt.score_r.to_i
      bet = "r" + bt.score_l.to_s + bt.score_r.to_s
    else
      bet = "d" + bt.score_l.to_s + bt.score_r.to_s
    end
    bet
  end
end
