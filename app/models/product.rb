class Product < ApplicationRecord
  validates_uniqueness_of :title

  validates :title, presence: true
  validates :description, length: { minimum: 100 }
  validates :image_url, format: { with: %r{[\w]+.(jpg|gif|png)} }
  validates :price, presence: true, numericality: { greater_than: 0.00 }
end
