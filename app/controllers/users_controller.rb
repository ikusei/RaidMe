class UsersController < ApplicationController
# Fachspezifische Basisqualifikation Web - QPT2a
# Barbara Huber (1010601010) 
# FH Salzburg | MMT-B2012

  def add_friend

  end

  def remove_friend

  end

  def index
    @users = User.find(:all)
  end

  def show
   @user = User.find(params[:id])
   @product = Product.where(:user_id => @user)
   @fridge_friend = FridgeFriend.find(:all, :limit => 10)
   @product_arrangement = ProductArrangement.find( :all )
  end


	def update
    unless params[:id]
      current_user.id
    end
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    redirect_to user_path(@user)
  end
	
end
