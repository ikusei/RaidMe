class StaticPagesController < ApplicationController
  def home
  	@products = Product.find(:all)
  end

  def impressum
  end

  def about
  end
end
