class UsersController < ApplicationController
# Fachspezifische Basisqualifikation Web - QPT2a
# Barbara Huber (1010601010) 
# FH Salzburg | MMT-B2012

  def show
   @user = User.find(params[:id])
   @product = Product.find(:all)
   @fridge_friend = FridgeFriend.where(:user_id => current_user.id).all
   @product_arrangement = ProductArrangement.find(:all)
  end



	def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
	
end
