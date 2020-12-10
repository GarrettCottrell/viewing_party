class DashboardController < ApplicationController
  def index
    @chuck = ChuckFacade.find_joke
  end
end
