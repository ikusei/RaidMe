class Product < ActiveRecord::Base
  attr_accessible :datum, :marke, :name, :ort, :user_id

  
  belongs_to :user

  has_many :product_arrangements
end
