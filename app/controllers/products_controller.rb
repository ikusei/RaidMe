class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @product_arrangements = ProductArrangement.where(:product_id => params[:id], :user_id => current_user.id).first if current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.create!(params[:product])

    respond_to do |format|
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.js
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

      if @product.update_attributes(params[:product])
         redirect_to @product, notice: 'Product was successfully updated.' 
      else
        render action: "edit" 
      end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end
end
