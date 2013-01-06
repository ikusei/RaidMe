class RegistrationsController < Devise::RegistrationsController
  def update
    @products = Product.find(:all)
    @user = User.find(params[:id])
    redirect_to user_path(@user)
  end
end