class BetSecond < ActiveRecord::Base
  belongs_to :user

  def self.init
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
  end
end
