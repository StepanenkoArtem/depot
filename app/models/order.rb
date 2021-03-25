class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy, inverse_of: :order

  enum payment_method: {
    "Check" => 0,
    "Credit card" => 1,
    "Purchase order" => 2
  }
  validates :line_items, length: {
    minimum: 1,
    too_short: "Order must have at least %<count>s line item(s)"
  }
  validates :email, :address, :phone, presence: true
  validates :name, presence: true
  validates :payment_method, inclusion: payment_methods.keys

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
