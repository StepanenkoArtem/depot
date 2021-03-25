class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total
    line_items.each.map { |i| i.quantity * i.product.price.to_f }.sum.round(2)
  end

  def erase
    line_items.destroy_all
  end
end
