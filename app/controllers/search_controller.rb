class SearchController < ApplicationController
  respond_to do
    :js
    :html
  end
  def update_map
    @searchArticle = params[:searchArticle]
    cookies[:storred_search_Article] = @searchArticle

    @products = Product.where(:name => @searchArticle)
  end
end
