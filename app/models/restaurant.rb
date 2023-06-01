class Restaurant < ApplicationRecord
  has_many :menus, dependent: :destroy

  validates :name, :category, :open, :close, presence: true
end
