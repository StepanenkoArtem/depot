class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  enum payment_method: {
    "Check" => 0,
    "Credit card" => 1,
    "Purchase order" => 2
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
