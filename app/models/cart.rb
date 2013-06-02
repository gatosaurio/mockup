class Cart < ActiveRecord::Base
  belongs_to :customer
  has_many :line_items

  attr_accessible :purchased_at

  def total_price
		line_items.to_a.sum(&:full_price)
	end
end
