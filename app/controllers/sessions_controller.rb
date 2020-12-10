class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if !user
      redirect_to welcome_path, notice: 'Email and/or password is incorrect'
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_index_path, notice: 'You are now logged in'
    else
      redirect_to welcome_path, notice: 'Email and/or password is incorrect'
    end
  end
end
