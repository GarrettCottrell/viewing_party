class FriendshipsController < ApplicationController
  def create
    if User.user_exists?(params[:friend_search])
      friend = User.find_friend(params[:friend_search])
      friendship = Friendship.new(user: current_user, friend: friend)
      if current_user.valid_friendship?(friend)
        friendship.save
        flash[:success] = "#{friend.name} successfully added as a friend"
      else
        flash[:error] = "New friends can't be yourself or existing friends"
      end
    else
      flash[:error] = 'User does not exist in the database'
    end
    redirect_to dashboard_index_path
  end
end
