class ProductsController < ApplicationController
  

  # GET /products/new
  # GET /products/new.json
  def new
    @product = current_user.products.new
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    if @product.save!
      redirect_to edit_user_registration_path, notice: 'Product was successfully created.'
    else
      render 'new'
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product_arrangement = ProductArrangement.where(:product_id => @product.id)
    @product_arrangement.each do |pa|
      pa.destroy
    end
    @product.destroy
    redirect_to :back
  end

  def get_user
    @user = User.find(:all)
  end
end
