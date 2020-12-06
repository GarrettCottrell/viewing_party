class FriendshipsController < ApplicationController

  def create
    friend = User.find_friend(params[:friend_search])
    Friendship.create(user:current_user, friend:friend)
    redirect_to dashboard_index_path
  end
end
