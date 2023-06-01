class MenusController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.create(menu_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.find(params[:id])
    @menu.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private
  def menu_params
    params.require(:menu).permit(:name, :price)
  end
end