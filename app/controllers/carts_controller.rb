class CartsController < ApplicationController
# probably going to want step 15 --Add a before_filter to any controller that you want to secure. This will force user's to login before they can see the actions in this controller. https://gist.github.com/thebucknerlife/10090014
  def show
  end

  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)

    redirect_to :back
  end

  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)

    redirect_to :back
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
