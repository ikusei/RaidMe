class StaticPagesController < ApplicationController
  def home
  	@products = Product.find(:all)

  	@storred_search_article = cookies[:storred_search_article]
  end

  def impressum
  end

  def about
  end
end
