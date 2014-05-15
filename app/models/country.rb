# encoding: UTF-8
require "csv"
require 'kconv'

class Country < ActiveRecord::Base
  def self.init
    Country.destroy_all
    File.foreach("#{Rails.root}/public/country.csv") do |line|
      puts line.to_s.toutf8
      row = CSV.parse(line.to_s.toutf8)
      country = Country.new
      country["name"] = row[0][0].to_s
      country["code"] = row[0][1].to_s
      country["group"] = row[0][2].to_s
      country.save
    end
  end
end
