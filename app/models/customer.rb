class Customer < ActiveRecord::Base
  attr_accessible :name, :street

  has_many :carts
end
