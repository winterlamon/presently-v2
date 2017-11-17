class FriendshipsController < ApplicationController

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to user_path(friend)
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
    end
  end

  # private

  # def friendship_params
  #   params.require(:friendship).permit(:friend_id, :user_id)
  # end
end
