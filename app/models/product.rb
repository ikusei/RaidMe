class Product < ActiveRecord::Base
  attr_accessible :datum, :name, :user_id

  
  belongs_to :user

  has_one :product_arrangements, :dependent => :destroy

end
