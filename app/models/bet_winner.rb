class BetWinner < ActiveRecord::Base
  belongs_to :user

  def self.init
    BetWinner.destroy_all
    users = User.all
    users.each do |u|
      bet = BetWinner.new
      bet.winner_first = ""
      bet.winner_second = ""
      bet.winner_third = ""
      bet.user_id = u.id
      bet.save
    end
  end
end
