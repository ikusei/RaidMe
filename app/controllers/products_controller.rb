class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    @products = Product.find(:all)
    @user = User.find(:all)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = current_user.products.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
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
    redirect_to :back
  end

  def get_user
    @user = User.find(:all)
  end
end
