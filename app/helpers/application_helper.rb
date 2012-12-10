module ApplicationHelper
	def get_product
	  return Product.find(:all)
	end
end
