class BetFirst < ActiveRecord::Base
  belongs_to :user

  def self.init
    BetFirst.destroy_all
    users = User.all
    users.each do |u|
      File.foreach("#{Rails.root}/public/bet_first.csv") do |line|
        row = CSV.parse(line.to_s.toutf8)
        bet = BetFirst.new
        bet.match_code = row[0][0].to_s
        bet.score_l = ""
        bet.score_r = ""
        bet.group = row[0][1].to_s
        bet.user_id = u.id
        bet.save
      end
    end
  end
end
