class ProductArrangement < ActiveRecord::Base
  attr_accessible :product_id

  has_one :user
  has_one :product

  belongs_to :user
  belongs_to :product

end
