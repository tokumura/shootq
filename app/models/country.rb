# encoding: UTF-8

class Country < ActiveRecord::Base
  def self.init
    Country.destroy_all

    country = Country.new
    country["name"] = "$B%V%i%8%k(B"
    country["code"] = "BRA"
    country["group"] = "A" 
    country.save

  end
end
