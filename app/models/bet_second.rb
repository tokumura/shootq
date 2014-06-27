class BetSecond < ActiveRecord::Base
  belongs_to :user

  def self.get_color group_name, user_id
    user = User.find_by id: user_id 
    bs = user.bet_second
    bet = Array.new
    tmp = Array.new

    case group_name
    when "a" then
      tmp << bs.a1
      tmp << bs.a2
    when "b" then
      tmp << bs.b1
      tmp << bs.b2
    when "c" then
      tmp << bs.c1
      tmp << bs.c2
    when "d" then
      tmp << bs.d1
      tmp << bs.d2
    when "e" then
      tmp << bs.e1
      tmp << bs.e2
    when "f" then
      tmp << bs.f1
      tmp << bs.f2
    when "g" then
      tmp << bs.g1
      tmp << bs.g2
    when "h" then
      tmp << bs.h1
      tmp << bs.h2
    else
    end

    rs = ResultSecond.find_by group_name: group_name
    rss = rs.countries.to_s.split("/")

    hit_count = 0
    tmp.each do |t|
      if rss.include?(t)
        hit_count = hit_count + 1 
      end
    end

    if hit_count == 0
      color = "#fff"
    elsif hit_count == 1
      color = "#98fb98"
    elsif hit_count == 2
      color = "#ff8e8e"
    end
    
    color
  end

  def self.get_score user_id
    score_total = 0

    user = User.find_by id: user_id

    %w(a b c d e f g h).each do |group_name|

      bs = user.bet_second
      tmp = Array.new

      case group_name
      when "a" then
        tmp << bs.a1
        tmp << bs.a2
      when "b" then
        tmp << bs.b1
        tmp << bs.b2
      when "c" then
        tmp << bs.c1
        tmp << bs.c2
      when "d" then
        tmp << bs.d1
        tmp << bs.d2
      when "e" then
        tmp << bs.e1
        tmp << bs.e2
      when "f" then
        tmp << bs.f1
        tmp << bs.f2
      when "g" then
        tmp << bs.g1
        tmp << bs.g2
      when "h" then
        tmp << bs.h1
        tmp << bs.h2
      end
      
      rs = ResultSecond.find_by group_name: group_name
      rss = rs.countries.to_s.split("/")
      tmp.each do |t|
        if rss.include?(t)
          score_total = score_total + 3
        end
      end
    end

    score_total
  end

  def self.init
=begin
    BetSecond.destroy_all
    users = User.all
    users.each do |u|
      bet = BetSecond.new
      bet.a1 = ""
      bet.a2 = ""
      bet.b1 = ""
      bet.b2 = ""
      bet.c1 = ""
      bet.c2 = ""
      bet.d1 = ""
      bet.d2 = ""
      bet.e1 = ""
      bet.e2 = ""
      bet.f1 = ""
      bet.f2 = ""
      bet.g1 = ""
      bet.g2 = ""
      bet.h1 = ""
      bet.h2 = ""
      bet.user_id = u.id
      bet.save
    end
=end
  end
end
