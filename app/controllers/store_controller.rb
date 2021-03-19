class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(updated_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
  end
end
