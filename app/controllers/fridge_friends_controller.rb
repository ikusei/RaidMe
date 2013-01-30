class FridgeFriendsController < ApplicationController
  
  def index
    @fridge_friend = FridgeFriend.find(:all)
    
  end
  
  # POST /fridge_friends
  # POST /fridge_friends.json
  def create
    @fridge_friend = current_user.fridge_friends.build(:friend_id => params[:friend_id])
    @fridge_friend.save
      if @fridge_friend.save
        redirect_to root_url, notice: 'Fridge friend was successfully created.'
      else
        redirect_to :back, :notice => 'creating Fridge Friend was not successful'
      end
  end

  # DELETE /fridge_friends/1
  # DELETE /fridge_friends/1.json
  def destroy
    @fridge_friend = current_user.fridge_friends.find(params[:id])
    @fridge_friend.destroy
    redirect_to root_url, notice: 'Fridge friend was successfully destroyed.'
    
  end
end
