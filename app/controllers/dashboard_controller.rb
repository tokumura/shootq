class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def index
    @title = "$B%@%C%7%e%\!<%I(B"
  end
end
