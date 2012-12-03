class UsersController < ApplicationController
# Fachspezifische Basisqualifikation Web - QPT2a
# Barbara Huber (1010601010) 
# FH Salzburg | MMT-B2010

  
	
  

  def show
   @user = User.find(params[:id])
  end

	
	def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
	
end
