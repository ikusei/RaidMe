class ProductArrangementsController < ActionController::Base
  def new
    @interest = User.find(params[:id])
    @user = current_user.id
    @product = Product.find(params[:id])
    @product_arrangement = ProductArrangement.new
  end

  def edit
    @product_arrangement = ProductArrangement.find(params[:id])
  end

  def create
    @product_arrangement = current_user.product_arrangements.build(:product_id => params[:product_id], :interest_id => params[:interest_id], :acceptance => params[:acceptance])
    @product_arrangement.save
    @product = Product.find(params[:product_id])
      if @product_arrangement.save && current_user.points > -20
        current_user.points -= 1
        current_user.update_attribute(:points, current_user.points)
        @product.update_attribute(:status, true)
        redirect_to :back, notice: 'Product Request was successfully created.'
      else
        redirect_to :back, :notice => 'creating Product Request was not successful'
      end
  end

  def update
    @product_arrangement = ProductArrangement.find(params[:id])
    if current_user.id == @product_arrangement.interest_id 
      if @product_arrangement.update_attribute(:acceptance, true)
    
        current_user.points += 1

        current_user.update_attribute(:points, current_user.points)
        redirect_to :back, :notice => 'Product Arrangement was successfully updated.' 
      else
          redirect_to :back, :notice => 'Product Arrangement was not successfully updated.' 
      end
    end
  end

 
 
  def destroy
    @product_arrangement = ProductArrangement.find(params[:id])
    @product = Product.find( @product_arrangement.product_id )
    current_user.points += 1
    if @product_arrangement.destroy
      @product.update_attribute(:status, false)
      current_user.update_attribute(:points, current_user.points)
      redirect_to :back, notice: 'Product Request was successfully destroyed.'
    else
      redirect_to :back, notice: 'destroying Product Request was not successful.'
    end
  end
end