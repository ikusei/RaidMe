class ProductArrangement < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :acceptance

  
  has_many :users

  has_many :products
end
