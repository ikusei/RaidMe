class Product < ActiveRecord::Base
  attr_accessible :datum, :marke, :name, :ort

  has_many :fridges, :dependent => :destroy
  has_many :users, :through => :fridges

  has_many :product_arrangements
end
