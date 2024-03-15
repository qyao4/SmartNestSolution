class Product < ApplicationRecord
  belongs_to :category

  # Validates the presence of name, SKU, quantity, and price
  validates :name, :sku, :quantity, :price, presence: true

  # Validates the uniqueness of SKU
  validates :sku, uniqueness: true

  # Validates that quantity is an integer greater than or equal to 0
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Validates that price is a positive number
  validates :price, numericality: { greater_than: 0 }

  # Optional: Validates the length of name and allows description to be blank
  validates :name, length: { in: 3..100 }
  validates :description, length: { maximum: 1000 }, allow_blank: true
end
