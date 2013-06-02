class LineItemsController < ApplicationController

	def new
		@line_item = LineItem.new
	end

	def create
		
		@product = Product.find(params[:product_id])
    	if LineItem.exists?(:cart_id => current_cart.id, :product_id => @product.id)
      		item = LineItem.find(:first, :conditions => [ "cart_id = #{current_cart.id} AND product_id = #{@product.id}" ])
      		LineItem.update(item.id, :quantity => item.quantity + 1)
    	else  
     		@line_item = LineItem.create!(:cart => current_cart, :product => @product, :quantity => 1, :unit_price => @product.price)
     		flash[:notice] = "Added #{@product.name} to cart."
    	end
    redirect_to new_cart_path
  	end

end
