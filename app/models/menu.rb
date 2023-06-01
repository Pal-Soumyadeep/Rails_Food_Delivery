class Menu < ApplicationRecord
  belongs_to :restaurant

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
