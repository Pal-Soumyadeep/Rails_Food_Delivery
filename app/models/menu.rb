class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :line_items, dependent: :destroy

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
