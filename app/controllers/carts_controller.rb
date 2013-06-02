class CartsController < ApplicationController
  def new
  	@products = Product.all
  end

  def create
  	@cart = Customer.carts.build(params[:cart])
  	if @cart.save
  		flash[:notice] = "Cart created"
  		redirect_to customers_path
  	else
  		render 'new'
  end 
end
end
