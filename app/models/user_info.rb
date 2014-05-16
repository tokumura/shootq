class UserInfo < ActiveRecord::Base
  belongs_to :user

  def self.init
    User.destroy_all
    UserInfo.destroy_all

    File.foreach("#{Rails.root}/public/user.csv") do |line|
      puts line.to_s.toutf8
      row = CSV.parse(line.to_s.toutf8)

      user = User.new
      user.account = row[0][0].to_s
      user.password = "aaaaaaaa"
      user.password_confirmation = "aaaaaaaa"
      user.save!

      user_info = UserInfo.new
      user_info.user_id = user.id
      user_info.name = row[0][1].to_s
      user_info.save
    end
  end
end
