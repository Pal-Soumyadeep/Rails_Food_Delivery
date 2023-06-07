class LineItem < ApplicationRecord
  belongs_to :menu
  belongs_to :cart
  belongs_to :order, optional: true

  def total_price
    return 0 if menu.nil? || quantity.nil?
    quantity * menu.price
  end
end
