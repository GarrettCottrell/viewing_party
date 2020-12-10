class FriendshipsController < ApplicationController
  def create
    if User.user_exists?(params[:friend_search])
      friend = User.find_friend(params[:friend_search])
      make_valid_friendship(friend)
    else
      flash[:error] = 'User does not exist in the database'
    end
    redirect_to dashboard_index_path
  end

  private

  def make_valid_friendship(friend)
    if current_user.valid_friendship?(friend)
      Friendship.create(user: current_user, friend: friend)
      flash[:success] = "#{friend.name} successfully added as a friend"
    else
      flash[:error] = "New friends can't be yourself or existing friends"
    end
  end
end
