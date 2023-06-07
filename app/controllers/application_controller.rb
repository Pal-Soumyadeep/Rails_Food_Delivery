class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_cart
  before_action :set_current_user

  private

  def current_cart
    @current_cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @current_cart.id
  end

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end
end
