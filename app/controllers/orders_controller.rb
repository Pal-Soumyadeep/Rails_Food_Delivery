class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.line_items << @current_cart.line_items
    @order.save

    @current_cart.destroy
    session[:cart_id] = nil

    redirect_to root_path, notice: 'Order was successfully created.'
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_method)
  end
end
