class ProductArrangement < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :acceptance, :interest_id

  validates :user_id, :presence => true
  validates :interest_id, :presence => true
  validates :product_id, :presence => true
  
  has_one :user
  has_one :interest, :class_name => "User"
  has_one :product
  
  belongs_to :user
  belongs_to :interest, :class_name => "User"

  belongs_to :product
end
