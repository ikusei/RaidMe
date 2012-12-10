class Fridge < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :amount

  belongs_to :user
  belongs_to :product
end

