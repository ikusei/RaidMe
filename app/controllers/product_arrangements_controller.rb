class ProductArrangementsController < ActionController::Base
  before_filter :get_product, :only => [:edit, :show, :update, :destroy]
  before_filter :get_invite_user, :only => [:update, :destroy]
  before_filter :check_user, :only => [:update]
  before_filter :check_points, :only => [:create]

  def create # user_id form product_a is user that wants to eat at someone's place
      @product_arrangement = ProductArrangement.new(:user_id => current_user.id,
                                              :product_id => params[:product_id],
                                              :acceptance => false,
                                              :mail_notification => params[:receive_mail].to_i)
      
      if @product_arrangement.save && current_user.points > 0
        current_user.points -= 1
        current_user.update_attribute(:points, current_user.points)
        redirect_to product_arrangement_status_path(params[:product_id], 'accepted'), :notice => I18n.t('product_arrangements.create_success')
      else
        redirect_to product_arrangement_status_path(params[:product_id], 'denied'), :notice => I18n.t('product_arrangements.create_fail')
      end
  end

  def update
    current_product_id = @product_arrangement.product_id
    if current_user.id == @product_arrangement.product.user_id #Cook
      if @product_arrangement.update_attribute(:acceptance, true)
		
		# yes you can
		productMailer.notification_email(current_user, @user_to_invite, "Cook invite you").deliver
		
        current_user.points += 1
        product = product.find(current_product_id)
        product.slots -= 1 if product.slots > 0
        product.save

        current_user.update_attribute(:points, current_user.points)
        current_user.send_message(@product_arrangement.user, I18n.t('message.accept', :title => product.title), I18n.t("message.info") )
        redirect_to :back, :notice => I18n.t('product_arrangements.accept_success')
      else
          redirect_to :back, :notice => I18n.t('product_arrangements.accept_fail')
      end
    end
  end
  
  def destroy
    if current_user.id == @product_arrangement.product.user_id #Cook
      if @product_arrangement.destroy
      
        # yes you can not!
        productMailer.notification_email(current_user, @user_to_invite, "Cook disinvite you").deliver

        @product_arrangement.user.points += 1
        @product_arrangement.user.update_attribute(:points, @product_arrangement.user.points)
        current_user.send_message(@product_arrangement.user, I18n.t('message.reject', :title => @product_arrangement.product.title), I18n.t('message.sorry') )
        redirect_to :back, :notice => I18n.t('product_arrangements.delete_success')
      else
        redirect_to :back, :notice => I18n.t('product_arrangements.delete_fail')
      end
    elsif current_user.id == @product_arrangement.user_id #Eater
      unless @product_arrangement.acceptance
        if @product_arrangement.destroy
          @product_arrangement.user.points += 1
          @product_arrangement.user.update_attribute(:points, @product_arrangement.user.points)
          redirect_to :back, :notice => I18n.t('product_arrangements.delete_success')
        else
          redirect_to :back, :notice => I18n.t('product_arrangements.delete_fail')
        end
      else
        redirect_to :back, :notice => I18n.t('product_arrangements.acceptance_given_fail')
      end
    else
      redirect_to root_path, :notice => I18n.t('application.rights_fail')
    end
  end

  private

  def check_points
    if current_user.points <= 0
      redirect_to product_path(params[:product_id]), :notice => I18n.t('product_arrangements.point_fail')
    end
  end

  def get_product
    @product_arrangement = productArrangement.find(params[:id])
  end

  def check_user
    unless current_user.id == @product_arrangement.product.user_id
      redirect_to root_path, :notice => I18n.t('application.rights_fail')
    end
  end
  
  def get_invite_user
    @user_to_invite = User.find( @product_arrangement.user_id )
  end
end