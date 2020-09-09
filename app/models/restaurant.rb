class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  categories = %w[chinese italian japanese french belgian]

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: categories, message: '%{value} is not a valid category' }
end
