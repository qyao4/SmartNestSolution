class Category < ApplicationRecord
  has_many :products

  # Validates the presence and uniqueness of the name
  validates :name, presence: true, uniqueness: true

  # If you have a description field and want to ensure a minimum length
  validates :description, length: { minimum: 10 }, allow_blank: true
end
