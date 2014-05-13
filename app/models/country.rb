# encoding: UTF-8

class Country < ActiveRecord::Base
  def self.init
    Country.destroy_all

    country = Country.new
    country["name"] = "ブラジル"
    country["code"] = "BRA"
    country["group"] = "A" 
    country.save

  end
end
