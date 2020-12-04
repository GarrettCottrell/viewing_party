class DiscoverController < ApplicationController
  def new
    @user = current_user
  end
end
