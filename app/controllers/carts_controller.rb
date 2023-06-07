class CartsController < ApplicationController
  def show
    @cart = @current_cart
    @line_items = @cart.line_items.includes(:menu)
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path, notice: 'Cart was successfully destroyed.'
  end
end
