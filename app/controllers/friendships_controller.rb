class FriendshipsController < ApplicationController

  def create
    friend = User.where(email:params[:friend_search])[0]
    Friendship.create(user:current_user, friend:friend)
    redirect_to dashboard_index_path
  end
end
