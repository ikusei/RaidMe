class FridgeFriendsController < ApplicationController
  
  def new
    @user = current_user
    @friend = User.find(params[:id])
    @fridge_friend = FridgeFriend.new
  end

  # GET /fridge_friends/1/edit
  def edit
    @fridge_friend = FridgeFriend.find(params[:id])
  end

  # POST /fridge_friends
  # POST /fridge_friends.json
  def create
    @fridge_friend = current_user.fridge_friends.build(:friend_id => params[:friend_id])
    @fridge_friend.save
      if @fridge_friend.save
        redirect_to :back, notice: 'Fridge friend was successfully created.'
      else
        redirect_to :back, :notice => 'creating Fridge Friend was not successful'
      end
  end

  # DELETE /fridge_friends/1
  # DELETE /fridge_friends/1.json
  def destroy
    @fridge_friend = FridgeFriend.find(params[:id])
    if @fridge_friend.destroy
      redirect_to :back, notice: 'Fridge friend was successfully destroyed.'
    else
      redirect_to :back, notice: 'destroying Fridge friend was not successful.'
    end

    
  end
end
