class LineItemsController < ApplicationController
  def create
    chosen_product = Menu.find(params[:menu_id])
    current_cart = @current_cart

    if current_cart.menus.include?(chosen_product)
      @line_item = current_cart.line_items.find_by(menu_id: chosen_product.id)
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.menu = chosen_product
      @line_item.quantity = 1
    end

    if @line_item.save
      redirect_to cart_path(current_cart), notice: 'Line item was successfully created.'
    else
      redirect_to root_path, alert: 'Failed to add item to cart.'
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart), notice: 'Line item was successfully destroyed.'
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity.nil?
      @line_item.quantity = 1
    else
      @line_item.quantity += 1
    end
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity -= 1 if @line_item.quantity > 1
    @line_item.save
    redirect_to cart_path(@current_cart)
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :menu_id, :cart_id)
  end
end
