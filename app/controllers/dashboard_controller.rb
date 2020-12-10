class DashboardController < ApplicationController
  def index
    @chuck = ChuckFacade.get_joke
  end
end
