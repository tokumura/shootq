class ResultFirst < ActiveRecord::Base

  def self.init
    ResultFirst.destroy_all
    File.foreach("#{Rails.root}/public/bet_first.csv") do |line|
      row = CSV.parse(line)
      result = ResultFirst.new
      result.match_date = row[0][0].to_s
      result.dayofweek = row[0][1].to_s
      result.match_time = row[0][2].to_s
      result.group_name = row[0][3].to_s
      result.match_code = row[0][4].to_s
      result.score_l = ""
      result.score_r = ""
      result.save
    end
  end

end
