class Product < ApplicationRecord
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates_uniqueness_of :title

  validates :title, presence: true
  validates :description, length: { minimum: 100 }
  validates :image_url,
            format: {
              with: /\w+.(jpg|gif|png)/,
              message: 'must be a URL for GIF, JPG or PNG image.'
            }
  validates :price, presence: true, numericality: { greater_than: 0.00 }

  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
