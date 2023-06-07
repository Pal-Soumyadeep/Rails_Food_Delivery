class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :menus, through: :line_items

  def subtotal
    sum = 0
    line_items.each do |line_item|
      sum += line_item.total_price
    end
    sum
  end
end
