class ProductArrangement < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :acceptance, :interest_id

  
  belongs_to :user
  belongs_to :interest, :class_name => "User"

  belongs_to :product
end
