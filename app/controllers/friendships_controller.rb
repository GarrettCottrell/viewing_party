class FriendshipsController < ApplicationController
  def create
    friend = User.find_friend(params[:friend_search])
    friendship = Friendship.new(user: current_user, friend: friend)
    if friendship.save
      flash[:success] = "#{friend.name} successfully added as a friend"
    else
      flash[:error] = 'User does not exist in the database'
    end
    redirect_to dashboard_index_path
  end
end
