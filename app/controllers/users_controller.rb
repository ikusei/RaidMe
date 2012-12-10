class UsersController < ApplicationController
# Fachspezifische Basisqualifikation Web - QPT2a
# Barbara Huber (1010601010) 
# FH Salzburg | MMT-B2012

  def show
   @user = User.find(params[:id])
   @fridge = Fridge.find(:all)
   @fridge_friend = FridgeFriend.find(:all)
   @product_arrangements = ProductArrangement.where(:product_id => params[:id], :user_id => current_user.id).first if current_user
  end



	def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
	
end
