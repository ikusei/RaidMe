class RegistrationsController < Devise::RegistrationsController
  def update
    @products = Product.find(:all)
  end
end