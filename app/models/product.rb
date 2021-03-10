class Product < ApplicationRecord
  validates_uniqueness_of :title

  validates :title, presence: true
  validates :description, length: { minimum: 100 }
  validates :image_url,
            format: {
              with: %r/\w+.(jpg|gif|png)/,
              message: 'must be a URL for GIF, JPG or PNG image.'
            }
  validates :price, presence: true, numericality: { greater_than: 0.00 }
end
