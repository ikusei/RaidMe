class Product < ActiveRecord::Base
  attr_accessible :datum, :marke, :name, :ort

  has_many :fridges
  has_many :users, :through => :fridges
end
